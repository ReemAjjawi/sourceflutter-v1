import 'package:flutter/material.dart';
import 'package:flutter_application_run/modules/login/login_screen.dart';
import 'package:flutter_application_run/modules/Sign_up/sign_up_screen.dart';
import 'package:flutter_application_run/modules/Sign_up/sign_up_binding.dart';
import 'package:flutter_application_run/modules/Splash/splash_binding.dart';
import 'package:flutter_application_run/modules/Splash/splash_screen.dart';
import 'package:get/get.dart';
import 'modules/login/login_binding.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBinding(),
      getPages: [
        GetPage(
            name: '/login',
            page: () => const LoginScreen(),
            binding: LoginBinding()),
        GetPage(
            name: '/splash',
            page: () => const SplashScreen(),
            binding: SplashBinding()),
        GetPage(
            name: '/sign_up',
            page: () => const SignUpScreen(),
            binding: SignUpBinding()),
      ],
    );
  }
}
