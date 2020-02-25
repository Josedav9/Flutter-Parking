import 'dart:convert';

import 'package:parking/models/User.dart';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String token;
    User user;

    UserData({
        this.token,
        this.user,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}
