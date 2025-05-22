import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Colors/Colors.dart';
import '../Fonts/Fonts.dart';

class SnackbarService {
  void showSnackbar({
    required String message,
    String? mainTitle = "Notice",
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.red,
  }) {
    Get.snackbar(
      margin: const EdgeInsets.only(top: 5,left: 20,right: 20),
      mainTitle ?? 'Notice',
      message,
      duration: duration,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: blackColor,
      titleText: Text(mainTitle!, style: smallWhiteColor,textAlign: TextAlign.end,),
      messageText: Text(message, style: verySmallBlackColor,textAlign: TextAlign.end,),
    );
  }
}