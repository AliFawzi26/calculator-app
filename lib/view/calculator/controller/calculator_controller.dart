import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class ControllerCalculator extends GetxController {
  String equation = ""; // المعادلة الحالية
  String result = "0"; // نتيجة المعادلة
  bool showFunctions = false; // حالة إظهار الوظائف الإضافية
  String selectedMode = "الإعداد التلقائي للنظام"; // وضع المظهر الحالي

  final List<String> buttons = [
    '√', 'π', '^', '!','˄',
    'AC', '()', '%', '÷',
    '7', '8', '9', 'X',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', ',', '=', '⌦ '
  ];

  final List<String> functions = ['DEG', 'sin', 'cos', 'tan', 'INV', 'e', 'ln', 'log'];

  List<Map<String, String>> history = [];

  void addInput(String value) {
    if (value == "AC") {
      equation = "";
      result = "0";
      showFunctions = false;
    } else if (value == "=") {
      try {
        result = _evaluateEquation();
        if (equation.isNotEmpty) {
          _addToHistory(equation, result);
        }
      } catch (e) {
        result = "Error";
      }
    } else if (value == "⌦ ") {
      if (equation.isNotEmpty) {
        equation = equation.substring(0, equation.length - 1);
        result = "0";
      }
    } else if (value == "()") {
      if (equation.contains('(') && !equation.contains(')')) {
        equation += ')';
      } else {
        equation += '(';
      }
    }
    // دعم الجذر التربيعي
    else if (value == "√") {
      equation += "sqrt(";
    }
    // دعم π
    else if (value == "π") {
      equation += "3.141592653589793";
    }
    else {
      equation += value;
    }
    update();
  }


  void toggleFunctions() {
    showFunctions = !showFunctions;
    update();
  }

  String _evaluateEquation() {
    final expression = equation
        .replaceAll('X', '*')  // استبدال علامة الضرب
        .replaceAll('÷', '/')  // استبدال علامة القسمة
        .replaceAll(',', '.')  // استبدال الفاصلة بفاصلة عشرية
        .replaceAll('sqrt', 'sqrt') // لا تحتاج إلى تعديل إضافي لأنها متوافقة
        .replaceAll('π', '3.141592653589793'); // تحويل π إلى قيمتها العددية

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, contextModel);
      return eval.toStringAsFixed(2);
    } catch (e) {
      return "Error";
    }
  }


  void _addToHistory(String equation, String result) {
    final timestamp = DateTime.now().toString();
    history.add({
      "equation": equation,
      "result": result,
      "timestamp": timestamp,
    });
    update();
  }

  void clearHistory() {
    history.clear();
    update();
  }}