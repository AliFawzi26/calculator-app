import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/core/const_data/app_colors.dart';
import '../../../core/const_data/text_style.dart';
import '../../../core/service/themeservice.dart';
import '../../calculator/controller/calculator_controller.dart';
import '../../widgets/container.dart'; // استدعاء الخلفية
import '../widget/dialogclear.dart';

class CalculatorHistoryScreen extends StatelessWidget {
  const CalculatorHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ControllerCalculator controller = Get.find<ControllerCalculator>();
    final ThemeService themeService = Get.find<ThemeService>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator History", style: FontStyles.getStyle1(context)),
        backgroundColor: themeService.isDarkMode.value ? AppColors.MiX : AppColors.W,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: themeService.isDarkMode.value ? AppColors.W : AppColors.LightText),
            onPressed: () {
              ClearHistoryDialog.show(
                onClear: () {
                  controller.clearHistory();
                },);},),
        ],
      ),
      body: Stack(
        children: [
           BackgroundBox(), //
          SafeArea(
            child: GetBuilder<ControllerCalculator>(
              builder: (controller) {
                if (controller.history.isEmpty) {
                  return Center(
                    child: Text("No history available.", style: FontStyles.getStyle1(context)),);}
                return ListView.builder(
                  itemCount: controller.history.length,
                  itemBuilder: (context, index) {
                    final item = controller.history[index];
                    return ListTile(
                      title: Text(
                        "Equation: ${item['equation']}, Result: ${item['result']}",
                        style: TextStyle(color: themeService.isDarkMode.value ? AppColors.W : AppColors.LightText),
                      ),
                      subtitle: Text(
                        "Timestamp: ${item['timestamp']}",
                        style: TextStyle(color: themeService.isDarkMode.value ? AppColors.W1 : AppColors.LightText),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
