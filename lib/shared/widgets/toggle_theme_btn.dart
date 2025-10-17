import 'package:fl_pokedex/core/theme/app_theme.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleThemeBtn extends StatelessWidget {
   
  const ToggleThemeBtn({super.key});
  
  @override
  Widget build(BuildContext context) {

    final themeController = Get.find<ThemeController>();

    return ElevatedButton(
      onPressed: () => themeController.toggleTheme(),
      child: Obx(() => IconButton(
        icon: Icon(
          themeController.isDarkMode.value ? Icons.wb_sunny : Icons.nights_stay,
        ),
        onPressed: () => themeController.toggleTheme(),
      ))
    );
  }
}