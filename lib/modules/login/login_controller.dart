import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../models/login_model.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  static final username = TextEditingController();
  static final password = TextEditingController();
  LoginService loginService = LoginService();
  GetStorage storage = GetStorage();
  //="".obs as TextEditingController;
  final formkeyForLogin = GlobalKey<FormState>();
  static RxBool isLoading = false.obs;

  String? emailValidator(String value) {
    if (!EmailValidator.validate(value)) {
      Get.snackbar('Email', 'Email Is Not Valid');
      return 'Email Is Not Valid';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if ((value.length < 3) || (value.isEmpty)) {
      Get.snackbar('Password', 'Password Is Not Valid');
      return 'Password Is Not Valid';
    }
    return null;
  }

  LoginModel login =
      LoginModel(username: username.text, password: password.text);

  void doLogin() async {
    final isvalid = formkeyForLogin.currentState!.validate();
    if (!isLoading.value) {
      if (isvalid) {
        isLoading(true);
        formkeyForLogin.currentState!.save();
        try {
          print("immmmmmmmmmmmmmkjhgghjkjh in controllllller");
          print(LoginController.isLoading.value);
          await loginService.login(login).then((value) {
            print("immmmmmmmmmmmmm in controllllller");
            Get.snackbar('Login', 'Login Successfully',
                snackPosition: SnackPosition.BOTTOM);
            // hzf async w read storage
          });
        } catch (e) {
          Get.snackbar('error on controller', '$e');
          print(e);
        } finally {
          isLoading(false);
        }
      }
    }
  }
}
