

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class ThemeService extends GetxService {
   final _storageKey = "isDarkMode";
   var isDarkMode = false.obs; // حالة السمة


   // الحصول على وضع السمة الحالي
 ThemeMode getThemeMode() {
     return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
   }
//
//   // تبديل السمة
  void switchTheme(bool isDarkMode) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setBool(_storageKey, isDarkMode);
     this.isDarkMode.value = isDarkMode; // تحديث حالة السمة
     Get.changeThemeMode(
         isDarkMode ? ThemeMode.dark : ThemeMode.light); // تغيير السمة
   }

//   // تحميل السمة المحفوظة
  Future<void> loadTheme() async {
     final prefs = await SharedPreferences.getInstance();
     final isDarkMode = prefs.getBool(_storageKey) ?? false;
     this.isDarkMode.value = isDarkMode; // تحميل حالة السمة
     Get.changeThemeMode(
          isDarkMode ? ThemeMode.dark : ThemeMode.light); // تحميل السمة
  }
//

   }

