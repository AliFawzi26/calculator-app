import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/text_style.dart';
import '../../../core/service/themeservice.dart';
import '../../calculator_history/screen/calculatorhistroyscreen.dart';
import '../../widgets/container.dart';
import '../controller/calculator_controller.dart';
import '../widget/button.dart';
import '../widget/dialog.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ControllerCalculator());
    final themeService = Get.find<ThemeService>();
    return Scaffold(
      body: Stack(
        children: [
          BackgroundBox() ,
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(20.w),
                    child: GetBuilder<ControllerCalculator>(
                      builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.equation, style: FontStyles.getStyle(context),),
                            SizedBox(height: 10.h),
                            Text(controller.result, style: FontStyles.getStyle1(context),),
                          ],
                        );
                      },
                    ),),),
                GetBuilder<ControllerCalculator>(
                  builder: (controller) {
                    if (controller.showFunctions) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics:  ScrollPhysics(),
                        padding: EdgeInsets.all(10.w),
                        itemCount: controller.functions.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final func = controller.functions[index];
                          return ElevatedButton(
                          style: FontStyles.getStyleb(context),
                            onPressed: () {
                              controller.addInput(func + '(');
                              controller.toggleFunctions();
                            },
                            child: Text(func, style: FontStyles.getStyle2(context),),
                          );},);}
                    return const SizedBox.shrink();},),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics:  ScrollPhysics(),
                        padding: EdgeInsets.all(10.w),
                        itemCount: 5, // Number of buttons in the first row
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // 5 buttons in the first row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final button = controller.buttons[index];
                          return CalculatorButton(
                            label: button,
                            onTap: () {
                              if (button == "˄") {
                                controller.toggleFunctions();
                              } else {
                                controller.addInput(button);
                              }
                            },
                            color: themeService.isDarkMode.value
                                ? AppColors.bl
                                : AppColors.LightSecondary,
                            textColor: themeService.isDarkMode.value
                                ? AppColors.W
                                : AppColors.LightText,);},),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics:  ScrollPhysics(),
                          padding: EdgeInsets.all(10.w),
                          itemCount: controller.buttons.length - 5, // Remaining buttons
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // 4 buttons per row
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final button = controller.buttons[index + 5]; // Start from the 6th button
                            return CalculatorButton(
                              label: button,
                              onTap: () {
                                if (button == "˄") {
                                  controller.toggleFunctions();
                                } else {
                                  controller.addInput(button);
                                }
                              },
                              color: themeService.isDarkMode.value
                                  ? AppColors.bl
                                  : AppColors.LightSecondary,
                              textColor: themeService.isDarkMode.value
                                  ? AppColors.W
                                  : AppColors.LightText,
                            );
                          },
                        ),
                      ),
                    ],),),],),)      ,
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Obx(() {
              return PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "السجل") {
                    Get.to(() => CalculatorHistoryScreen());
                  } else if (value == "اختيار المظهر") {ThemeDialog().showThemeDialog(context);}},
                itemBuilder: (context) => [
                  PopupMenuItem(value: "السجل", child: Text('السجل')),
                  PopupMenuItem(value: "اختيار المظهر", child: Text("اختيار المظهر")),
                ],
                icon: Icon(
                  Icons.more_vert,
                  color: themeService.isDarkMode.value
                      ? AppColors.W
                      : AppColors.LightText,),
              );
            }),
          ),
        ],
      ),
     );}}