import 'dart:convert';
import 'package:flutter_application_run/Configuration/config.dart';
import 'package:flutter_application_run/get_storage/get_storage.dart';
import 'package:flutter_application_run/modules/group/group_controller.dart';
import 'package:http/http.dart ' as http;

class GroupService {
  GetStorage storage = GetStorage();
  static var url =
      Uri.parse(Config.domainNameServer + Config.addFile + Config.x);

  late dynamic message;
  Future<String> addFileToGroup(String filename) async {
    String token = await storage.read("token") ?? "";

    try {
      print("hiiiiiiii");
      http.MultipartRequest request = http.MultipartRequest('POST',
          Uri.parse(Config.domainNameServer + Config.addFile + Config.x));

      request.headers.addAll({'Authorization': 'Bearer $token'});

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'filename',
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
        print("responsestatusCodelkjhgfghjklkjhgfghjk");
        print(message);

        return message;
      } else if (response.statusCode == 422) {
        print("reeeeeeeeeeeeeeeeeeeem");
        throw Exception("reem error"); //  message = jsonResponse['errors'];
      } else {
        print("responsestatusCodelkjhgfghjklkjhgfghjk8765434567");
        throw Exception('server error');
      }
    } finally {}
  }
}
