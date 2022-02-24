import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController{
  final Future<SharedPreferences> _sharedPreferences =  SharedPreferences.getInstance();

  Future<void> setUserData(UserModel userModel) async
  {
    await _sharedPreferences.then((value) {
      value.setString('userData', jsonEncode(userModel.toJson()));
    });
  }
  Future<UserModel?> getUserData() async
  {
    UserModel? userModel;
    await _sharedPreferences.then((value) {
      userModel = UserModel.fromJson( jsonDecode(value.getString('userData')!));
    });
    return userModel;
  }
  Future<void> deleteUserData() async
  {
    await _sharedPreferences.then((value) {
      value.clear();
    });
  }
}