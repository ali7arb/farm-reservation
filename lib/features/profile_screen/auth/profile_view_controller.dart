import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    required String name,
    required String phone,
    required String email,
  }) {
    if (profileImage != null) {
      getProfileImage();
    } else {
      UserModel user = UserModel(
        name: name,
        email: email,
        phone: phone,
      );
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user.userId)
          .update(user.toJson())
          .then((value) {
        getCurrentUser();
      }).catchError((e) {
        print(e.toString());
      });
    }
  }
}
