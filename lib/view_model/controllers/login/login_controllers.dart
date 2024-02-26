import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/repository/login_repository/login_repository.dart';
import 'package:mvvmwithget/res/routes/routesname.dart';
import 'package:mvvmwithget/utils/utils.dart';

import '../../../models/login/login_model.dart';
import '../user_prefereances/user_preferences.dart';

class LoginControllers extends GetxController {
  final _api = LoginRepositroy();

  final prefs = UserPreferances();

  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  final emailnode = FocusNode().obs;
  final passwordnode = FocusNode().obs;

  @override
  void onClose() {
    email.value.dispose();
    password.value.dispose();
    emailnode.value.dispose();
    passwordnode.value.dispose();
    super.onClose();
  }

  void loginApi() async {
    Map<String, dynamic> data = {
      'email': email.value.text,
      'password': password.value.text
    };
    try {
      var response = await _api.login(data);
      if (kDebugMode) {
        print(response);
      }
      await prefs.saveUserPreferences(LoginModel.fromJson(response));
      Utils.snackBar('Success', 'Login successful');
      Get.offNamed(RoutesName.homeScreen);
    } catch (e) {
      Utils.snackBar('Error', e.toString());
    }
  }
}
