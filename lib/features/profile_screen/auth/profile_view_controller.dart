import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_farm/core/helper/local_storage_data.dart';
import 'package:reservation_farm/features/login_screen/auth/auth_login_controller.dart';
import 'package:reservation_farm/model/users/user_model.dart';

class ProfileViewController extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  final AuthLogin authLogin = Get.find();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final passwordController = TextEditingController().text;

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    UserModel? value = await localStorageData.getUser;
    _userModel = value ?? UserModel();
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    profileImage = File(pickedFile!.path);
  }

  void updateUser({
    String? name,
    String? phone,
    String? email,
  }) async {
    if (profileImage != null) {
      await uploadProfileImage();
    }

    UserModel updatedUser = UserModel(
      userId: _userModel?.userId,
      name: name ?? _userModel?.name,
      email: email ?? _userModel?.email,
      phone: phone ?? _userModel?.phone,
      pic: _userModel?.pic,
    );

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(updatedUser.userId)
        .update(updatedUser.toJson())
        .then((value) {
      getCurrentUser();
      Get.snackbar('Success', 'User data updated successfully');
    }).catchError((e) {
      Get.snackbar('Error', 'Failed to update user data');
      // ignore: avoid_print
      print(e.toString());
    });

    update();
  }

  Future<void> uploadProfileImage() async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child("profile_images/${_userModel?.userId}");

    UploadTask uploadTask = storageReference.putFile(profileImage!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String profileImageUrl = await taskSnapshot.ref.getDownloadURL();

    UserModel updatedUserWithImage = UserModel(
      userId: _userModel?.userId,
      name: _userModel?.name,
      email: _userModel?.email,
      phone: _userModel?.phone,
      pic: profileImageUrl,
    );

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(updatedUserWithImage.userId)
        .update(updatedUserWithImage.toJson());
  }
}
