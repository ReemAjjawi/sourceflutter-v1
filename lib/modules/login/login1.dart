import 'package:flutter/material.dart';
import 'package:flutter_application_run/modules/login/login_controller.dart';
import 'package:get/get.dart';

@immutable
class Login1 extends StatelessWidget {
  Login1({Key? key}) : super(key: key);
  final LoginController loginCon = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Form(
          key: loginCon.formkeyForLogin,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return loginCon.emailValidator(value!);
                },
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
                controller: LoginController.username,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: LoginController.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: " Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return loginCon.passwordValidator(value!);
                  }),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    loginCon.doLogin();
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("login"))
            ],
          ),
        )));
  }

  /*void clickLogin() async {
    EasyLoading.show(status: 'loading.. ');
    loginCon.doLogin();
     if (controller.loginStatus) {
    EasyLoading.showSuccess(controller.message);
    Get.toNamed('/Sign_up');
  } else {
    EasyLoading.showError(
        controller.message,
      );

      print('error here');
    }*/
}
