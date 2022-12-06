import 'dart:convert';

import 'package:flutter_application_run/Configuration/config.dart';
import 'package:flutter_application_run/Configuration/user_info.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:flutter_application_run/models/login_model.dart';
import 'package:flutter_application_run/models/login_response.dart';
import 'package:flutter_application_run/modules/login/login_controller.dart';
import 'package:http/http.dart ' as http;

class LoginService {
  GetStorage storage = GetStorage();
  static var url = Uri.parse(Config.domainNameServer + Config.authLogin);
  late dynamic token;
  late dynamic tokem;

  Future<LoginResponse> login(LoginModel login) async {
    try {
      print("responsestatusCode1");
      print(LoginController.username.text);
      http.Response response = await http.post(url, headers: {}, body: {
        "username": LoginController.username.text,
        "password": LoginController.password.text
      }

          // jsonEncode(login.toJson(),)

          );
      //  print(login.username);

      //print(response.statusCode);
      //print("responsestatusCoderemmmmmmmmmmmmmmmm1");
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        token = jsonResponse['token'];
        print("token now is $token");
        UserInformation.userToken = token;
        await storage.save('token', UserInformation.userToken);
        tokem = await storage.read('token');

        return LoginResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 422) {
        print("responsestatusCode23456761");
        throw Exception("reem error"); //  message = jsonResponse['errors'];
      } else {
        print("responsestatusCode111");
        throw Exception('server error');
      }
    } finally {}
  }
}
