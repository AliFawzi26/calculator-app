import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled5/routes.dart';
import 'package:untitled5/view/calculator/screen/calculator_screen.dart';
import 'binding/initial_bindings.dart';
import 'core/service/apptheme.dart';
import 'core/service/my_service.dart';
import 'core/service/themeservice.dart'; // استيراد الألوان المخصصة

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
          getPages: routes,
        theme: ThemeData.light(), // السمة الفاتحة
        darkTheme: ThemeData.dark(), // السمة الغامقة
        themeMode: ThemeService() .getThemeMode(), // استخدام السمة الحالية
        home: const CalculatorScreen());
      },
    );
  }
}