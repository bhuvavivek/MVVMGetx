import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    return Fluttertoast.showToast(
        msg: message, backgroundColor: AppColor.blackColor);
  }

  static snackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
    );
  }
}
