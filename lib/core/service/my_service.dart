
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/core/service/themeservice.dart';

import '../const_data/const_data.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyService().init());


}
