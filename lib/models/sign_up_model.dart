class SignUpModel {
  late String _username;
  late String _email;
  late String _password;

  SignUpModel(
      {required String username,
      required String email,
      required String password}) {
    _username = username;
    _email = email;
    _password = password;
  }

  String get username => _username;
  set username(String username) => _username = username;
  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = _username;
    data['email'] = _email;
    data['password'] = _password;
    return data;
  }
}
