import 'dart:convert';

import 'package:flutter_application_run/Configuration/config.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:flutter_application_run/modules/group/group_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class GroupService {
  GetStorage storage = GetStorage();
  static var url =
      Uri.parse(Config.domainNameServer + Config.addFile + Config.x);

  late dynamic message;

  Future<String> addFileToGroup(String filename) async {
    try {
      String token = await storage.read("token") ?? "";
      Map<String, String> header = {
        "content-type": "multipart/form-data",
        "Authorization": "Bearer $token",
        "Connection": "keep-alive"
      };
      print("hiiiiiiii");
      http.MultipartRequest request = http.MultipartRequest('POST',
          Uri.parse(Config.domainNameServer + Config.addFile + Config.x));

      request.headers.addAll(header);

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'file',
        GroupController.pickfile!.path!,
      );
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      final res = await http.Response.fromStream(response);
      print(response.statusCode);
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(res.body);
        print(response.statusCode);
        message = jsonResponse['message'];
        print(message);

        return message;
      } else if (response.statusCode == 422) {
        print("reeeeeeeeeeeeeeeeeeeem");
        throw Exception("reem error"); //  message = jsonResponse['errors'];
      } else {
        print(response.statusCode);
        print("responsestatusCodelkjhgfghjklkjhgfghjk8765434567");
        throw Exception('server error');
      }
    } finally {}
  }
}
