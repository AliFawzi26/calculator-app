import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled5/core/const_data/app_colors.dart';

import '../../../core/const_data/text_style.dart';
class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CalculatorButton({
    required this.label,
    required this.onTap,
    super.key, required Color color, required Color textColor,
  });
  Color _getButtonColor(String button) {
    if (button == "AC" || button == "=") {
      return AppColors.gr;
    } else if (['÷', 'X', '-', '+', '⌦ '].contains(button)) {
      return AppColors.bl;
    }
    return AppColors.bla;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          color: _getButtonColor(label),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            label,
         style: FontStyles.style2
          ),
        ),
      ),
    );
  }
}
