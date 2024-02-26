import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvmwithget/models/login/login_model.dart';
import 'package:mvvmwithget/res/routes/routesname.dart';

import '../controllers/user_prefereances/user_preferences.dart';

class SplashService {
  final UserPreferances prefs = UserPreferances();
  isLogin() async {
    LoginModel usermodel = await prefs.getUserPreferences();

    if (usermodel.token == null || usermodel.token!.isEmpty) {
      Timer(const Duration(seconds: 3),
          () => Get.offNamed(RoutesName.loginScreen));
    } else {
      Timer(const Duration(seconds: 3),
          () => Get.offNamed(RoutesName.homeScreen));
    }
  }
}
