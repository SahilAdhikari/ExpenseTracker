import 'dart:ffi';

class User {
  String? userName;
  String? password;
  String targetAmount = "30000";

  User(String userName, String password) {
    this.userName = userName;
    this.password = password;
    targetAmount = "30000";
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "password": password,
      "targetAmount": targetAmount
    };
  }

  User.fromjson(Map<String, dynamic> json) {
    userName = json['username'];
    password = json['password'];
    targetAmount = json['targetAmount'];
  }
}
