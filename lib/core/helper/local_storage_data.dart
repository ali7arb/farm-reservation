import 'dart:convert';

import 'package:get/get.dart';
import 'package:reservation_farm/model/users/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      return userModel;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('users');
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('users', json.encode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
