import 'package:get/get.dart';

import '../core/class/crud.dart';
import '../core/service/themeservice.dart';



class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(ThemeService());

  }
}
