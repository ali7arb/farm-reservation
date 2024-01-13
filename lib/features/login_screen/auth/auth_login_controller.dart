import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reservation_farm/core/helper/local_storage_data.dart';
import 'package:reservation_farm/features/controller_view.dart';
import 'package:reservation_farm/model/users/user_model.dart';
import '../../../core/service/firestore_user.dart';

class AuthLogin extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();

  late String email, password, name, phone;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }

  @override
  Future<void> onReady() async => super.onReady();

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(const ControllerView());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userData =
          await FireStoreUser().getCurrentUser(userCredential.user!.uid);
      if (userData.exists) {
        final userModelData = userData.data();
        if (userModelData != null) {
          setUser(UserModel.fromJson(userModelData as Map<String, dynamic>));
        }
      }
      Get.offAll(const ControllerView());
    } catch (e) {
      Get.snackbar(
        'Error Login Account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result =
        await facebookLogin.logIn(customPermissions: ['email']);

    final accessToken = result.accessToken?.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken!);

      await auth.signInWithCredential(faceCredential).then((user) async {
        {
          saveUser(user);
        }
      });
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(const ControllerView());
    } catch (e) {
      Get.snackbar(
        'Error Login Account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserModel?> saveUser(UserCredential user) async {
    if (user.user != null) {
      UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name,
        phone: phone,
        pic:
            'https://zultimate.com/wp-content/uploads/2019/12/default-profile.png',
      );
      await FireStoreUser().addUserToFireStore(userModel);
      setUser(userModel);
      return userModel;
    } else {
      return null;
    }
  }

  setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
