import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Get.to(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 131, 42, 9),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 131, 42, 9)),
                  Color(0xffF2861E)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Container(
              child: Text(
                "sourceSafe...",
                style: TextStyle(fontSize: 40),
              ),
              //   child: Image.asset(""),
            ),
          )
        ],
      ),
    );
  }
}
