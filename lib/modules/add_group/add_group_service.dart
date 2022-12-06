import 'dart:convert';
import 'package:flutter_application_run/Configuration/config.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:http/http.dart ' as http;

class AddGroupService {
  GetStorage storage = GetStorage();

  static var url = Uri.parse(Config.domainNameServer + Config.addGroup);

  late dynamic message;

  Future<String> addGroup(String name) async {
    String token = await storage.read("token") ?? "";

    print("token in add group service is $token");
    try {
      http.Response response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'ContentType': 'application/json'
      }, body: {
        "name": name,
      });

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);

        message = jsonResponse['message'];

        return message;
      } else if (response.statusCode == 422) {
        throw Exception("reem error"); //  message = jsonResponse['errors'];
      } else {
        throw Exception('server error');
      }
    } finally {}
  }
}
