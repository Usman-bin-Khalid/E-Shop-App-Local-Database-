import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkTheme = false;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    if (isDarkTheme) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update(); // Notify listeners of the state change
  }
}