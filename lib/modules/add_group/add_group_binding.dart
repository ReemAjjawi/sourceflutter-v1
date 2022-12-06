import 'package:flutter_application_run/modules/add_group/add_group_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGroupController>(() => AddGroupController());
  }
}
