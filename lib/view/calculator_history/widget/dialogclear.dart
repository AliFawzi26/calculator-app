import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearHistoryDialog {
  static void show({required VoidCallback onClear}) {
    Get.dialog(
      AlertDialog(
        title: const Text("Clear History"),
        content: const Text("Are you sure you want to clear the history?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Get.back(); // إغلاق مربع الحوار
            },
          ),
          TextButton(
            child: const Text("Clear"),
            onPressed: () {
              onClear(); // استدعاء وظيفة الحذف
              Get.back(); // إغلاق مربع الحوار
            },
          ),
        ],
      ),
    );
  }
}
