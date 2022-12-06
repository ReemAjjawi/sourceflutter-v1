import 'dart:convert';
import 'package:flutter_application_run/Configuration/config.dart';
import 'package:http/http.dart ' as http;
import '../../models/sign_up_model.dart';

class SignUpService {
  static var url = Uri.parse(Config.domainNameServer+Config.authSignUp);
  static late dynamic token;
  Future<void> signUp(SignUpModel signUpModelObject) async {
    try {
      http.Response response = await http.post(
        url,
        headers: {},
        // body: signUp.toJson(),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        // message = jsonResponse['msg'];
        token = jsonResponse['token'];
      } else if (response.statusCode == 422) {
        var jsonResponse = jsonDecode(response.body);
        //  message = jsonResponse['errors'];
      } else {
        throw Exception('server error');
      }
      throw Exception('failed');
    } finally {}
  }
}
