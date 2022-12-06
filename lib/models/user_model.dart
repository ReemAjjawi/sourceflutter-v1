class User {
  late int _id;
  late String _username;
  late bool _admin;
  late String _email;
  late String _password;
  late String _createdAt;
  late String _updatedAt;

  User(
      {required int id,
      required String username,
      required bool admin,
      required String email,
      required String password,
      required String createdAt,
      required String updatedAt}) {
    this._id = id;
    this._username = username;
    this._admin = admin;
    this._email = email;
    this._password = password;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get username => _username;
  set username(String username) => _username = username;
  bool get admin => _admin;
  set admin(bool admin) => _admin = admin;
  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _admin = json['admin'];
    _email = json['email'];
    _password = json['password'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['username'] = this._username;
    data['admin'] = this._admin;
    data['email'] = this._email;
    data['password'] = this._password;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}
