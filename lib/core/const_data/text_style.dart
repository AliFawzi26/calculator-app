
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/service/themeservice.dart'; // تأكد من صحة المسار
import '../../../core/const_data/app_colors.dart'; // تأكد من صحة المسار

class FontStyles {
  // أنماط نصية ثابتة
  static var Style1 = TextStyle(
    color: Colors.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  );

  static var style = TextStyle(
    color: Colors.white70,
    fontSize: 36.sp,
  );

  static var style2 = TextStyle(
    color: Colors.white,
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
  );

  static var style3 = TextStyle(
    fontSize: 18.sp, // حجم الخط متجاوب
    fontWeight: FontWeight.bold,
  );

  static var style4 = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
  );

  // أنماط ديناميكية بناءً على الوضع (ليلي/نهاري)
  static TextStyle getStyle(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return TextStyle(
      fontSize: 33.sp,
      color: themeService.isDarkMode.value ? Colors.white : AppColors.LightText,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getStyle1(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return TextStyle(
      fontSize: 22.sp,
      color: themeService.isDarkMode.value ? Colors.white : AppColors.LightText,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getStyle2(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return TextStyle(
      fontSize: 14.sp,
      color: themeService.isDarkMode.value ? AppColors.W : AppColors.LightText,
    );
  }

  // نمط ديناميكي للأزرار بناءً على الوضع (ليلي/نهاري)
  static ButtonStyle getStyleb(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return ElevatedButton.styleFrom(
      backgroundColor: themeService.isDarkMode.value
          ? AppColors.bl
          : AppColors.LightSecondary,
    );
  }
}