import 'package:flutter_application_run/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put<CollegesController>(CollegesController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
