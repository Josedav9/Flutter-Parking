import 'package:flutter/material.dart';
import 'package:parking/models/User.dart';

class UserData extends ChangeNotifier {
  String token;
  User user;

  UserData({
    this.token,
    this.user,
  });

  User get getUser {
    return this.user;
  }

  String get getToken {
    return this.token;
  }

  set setToken(String token) {
    this.token = token;
  }

  set setUser(User user) {
    this.user = user;
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}
