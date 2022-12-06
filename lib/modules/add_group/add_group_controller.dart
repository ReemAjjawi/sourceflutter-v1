import 'package:flutter/material.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:flutter_application_run/modules/add_group/add_group_service.dart';
import 'package:get/get.dart';

class AddGroupController extends GetxController {
  AddGroupService addGroupService = AddGroupService();
  static final name = TextEditingController();
  GetStorage storage = GetStorage();
  //="".obs as TextEditingController;
  RxBool isLoading = false.obs;
/*
  String? nameValidator(String value) {
    if (!EmailValidator.validate(value)) {
      Get.snackbar('Email', 'Email Is Not Valid');
      return 'Email Is Not Valid';
    }
    return null;
  }
*/
  void addNameForGroup(TextEditingController name) async {
    if (!isLoading.value) {
      isLoading(true);
      try {
        print("immmmmmmmmmmmmm in controllllller of grooooooup");

        await addGroupService.addGroup(name.text).then((value) async {
          Get.snackbar('AddGroup', 'done Successfully',
              snackPosition: SnackPosition.BOTTOM);

          // hzf async w read storage
        });
      } catch (e) {
        Get.snackbar('every thing its okay', '$e');
      } finally {
        isLoading(false);
      }
    }
  }
}
