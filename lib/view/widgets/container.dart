import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/service/themeservice.dart';

class BackgroundBox extends StatelessWidget {
  const BackgroundBox({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: themeService.isDarkMode.value
              ? [AppColors.MiX, AppColors.Mix1]
              : [AppColors.LightSecondary, AppColors.LightPrimary],
        ),
      ),
    );
  }
}
