import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/service/themeservice.dart';

class ThemeDialog {
  void showThemeDialog(BuildContext context) {
    final modes = ['فاتح', 'غامق'];
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Directionality( // تعيين اتجاه النص للديلوغ
              textDirection: TextDirection.rtl, // من اليمين إلى اليسار
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "اختيار المظهر",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: modes.map((mode) {
                      return RadioListTile<String>(
                        title: Text(
                          mode,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        value: mode,
                        groupValue: Get.find<ThemeService>().isDarkMode.value ? "غامق" : "فاتح",
                        onChanged: (value) {
                          final themeService = Get.find<ThemeService>();
                          if (value == "فاتح") {
                            themeService.switchTheme(false); // تغيير إلى الوضع الفاتح
                          } else if (value == "غامق") {
                            themeService.switchTheme(true); // تغيير إلى الوضع الغامق
                          }
                          Navigator.of(context).pop();
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}