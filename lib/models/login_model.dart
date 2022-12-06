class LoginModel {
  late String _username;
  late String _password;

  LoginModel({required String username, required String password}) {
    this._username = username;
    this._password = password;
  }

  String get username => _username;
  set username(String username) => _username = username;
  String get password => _password;
  set password(String password) => _password = password;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = _username;
    data['password'] = this._password;
    return data;
  }
}
