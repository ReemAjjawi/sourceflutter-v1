import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_run/modules/Sign_up/sign_up_service.dart';
import 'package:get/get.dart';

import '../../models/sign_up_model.dart';

class SignUpController extends GetxController {
  static final username = TextEditingController();
  static final email = TextEditingController();
  static final password = TextEditingController();
  SignUpService signUpService = SignUpService();
  //="".obs as TextEditingController;
  final formkeyForSignUp = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  String? emailValidator(String value) {
    if (!EmailValidator.validate(value)) {
      Get.snackbar('Email', 'Email Is Not Valid');
      return 'Email Is Not Valid';
    }
    return null;
  }

  String? nameValidator(String value) {
    if (!(value.length < 3) || (value.isEmpty)) {
      Get.snackbar('name', 'name Is Not Valid');
      return 'name Is Not Valid';
    }
    return null;
  }

  String passwordValidator(String value) {
    if ((value.length < 5) || (value.isEmpty)) {
      Get.snackbar('Password', 'Password Is Not Valid');
      return 'Password Is Not Valid';
    }
    return '';
  }

  SignUpModel signUp = SignUpModel(
    email: email.text,
    password: password.text,
    username: username.text,
  );

  void doSignUp() async {
    final isvalid = formkeyForSignUp.currentState!.validate();
    if (!isLoading.value) {
      if (isvalid) {
        isLoading(true);
        formkeyForSignUp.currentState!.save();

        try {
          await signUpService.signUp(signUp).then((value) {
            Get.snackbar('SignUp', 'SignUp Successfully',
                snackPosition: SnackPosition.BOTTOM);
          });
        } catch (e) {
          Get.snackbar('error', '$e');
        } finally {
          isLoading(false);
        }
      }
    }
  }
}
