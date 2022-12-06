import 'package:flutter_application_run/models/user_model.dart';

class LoginResponse {
  late User _user;
  late String _token;

  LoginResponse({required User user, required String token}) {
    this._user = user;
    this._token = token;
  }

  User get user => _user;
  set user(User user) => _user = user;
  String get token => _token;
  set token(String token) => _token = token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _user = User.fromJson(json['user']);
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    data['token'] = this._token;
    return data;
  }
}
