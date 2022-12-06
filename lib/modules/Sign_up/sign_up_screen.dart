import 'package:flutter/material.dart';
import 'package:flutter_application_run/modules/add_group/add_group.dart';
import 'package:flutter_application_run/modules/login/login_screen.dart';
import 'package:flutter_application_run/modules/Sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpCon = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            color: Color(0xffF5591F),
            gradient: LinearGradient(
              colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                //     child: Image.asset(
                //     "",
                //   height: 90,
                // width: 90,
                //),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.bottomRight,
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          )),
        ),
        Form(
          key: signUpCon.formkeyForSignUp,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    return signUpCon.nameValidator(value!);
                  },
                  controller: SignUpController.username,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "USER Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    return signUpCon.emailValidator(value!);
                  },
                  controller: SignUpController.email,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    return signUpCon.passwordValidator(value!);
                  },
                  obscureText: true,
                  controller: SignUpController.password,
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Enter Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            signUpCon.doSignUp();
            Get.offAll(AddGroup());
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: Text(
              "REGISTER",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have Already Member?  "),
              GestureDetector(
                child: Text(
                  "Login Now",
                  style: TextStyle(color: Color(0xffF5591F)),
                ),
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
