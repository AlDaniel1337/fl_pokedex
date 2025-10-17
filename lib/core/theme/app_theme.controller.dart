import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './app_theme.dart';

class ThemeController extends GetxController {
  
  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isPlatformDarkMode;
  }

  ThemeData get currentTheme => isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(currentTheme); 
  }
}