import 'package:flutter_application_run/modules/group/group_controller.dart';
import 'package:get/get.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(() => GroupController());
  }
}
