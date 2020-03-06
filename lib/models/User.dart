import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:parking/models/Neighborhood.dart';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  bool enabled;
  List<String> roles;
  int points;
  bool isVerified;
  bool isOwner;
  String debt;
  bool payOnTime;
  int count;
  double averagePoints;
  String id;
  String username;
  String email;
  String phone;
  String firstName;
  String neighborhoodcode;
  String lastName;
  int homeNumber;
  int blockNumber;
  String address;
  int totalNumberOfUsers;
  var neighborhood;
  DateTime createdAt;
  String code;
  DateTime updatedAt;

  User({
    this.enabled,
    this.roles,
    this.points,
    this.isVerified,
    this.isOwner,
    this.debt,
    this.payOnTime,
    this.count,
    this.averagePoints,
    this.id,
    this.username,
    this.email,
    this.phone,
    this.firstName,
    this.neighborhoodcode,
    this.lastName,
    this.homeNumber,
    this.blockNumber,
    this.address,
    this.totalNumberOfUsers,
    this.neighborhood,
    this.createdAt,
    this.code,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        enabled: json["enabled"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        points: json["points"] ?? -1,
        isVerified: json["isVerified"],
        isOwner: json["isOwner"] ?? false,
        debt: json["debt"] ?? "NA",
        payOnTime: json["payOnTime"] ?? false,
        count: json["count"] ?? -1,
        averagePoints: json["averagePoints"] != null ? json["averagePoints"] + 0.0 : -1.0,
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        firstName: json["firstName"],
        neighborhoodcode: json["neighborhoodcode"],
        lastName: json["lastName"] ?? '',
        homeNumber: json["homeNumber"] ?? -1,
        blockNumber: json["blockNumber"] ?? -1,
        address: json["address"] ?? '',
        totalNumberOfUsers: json["totalNumberOfUsers"] ?? -1,
        neighborhood: json["neighborhood"] != null
            ? Neighborhood.fromJson(json["neighborhood"])
            : null,
        createdAt: DateTime.parse(json["createdAt"]),
        code: json["code"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "points": points,
        "isVerified": isVerified,
        "isOwner": isOwner,
        "debt": debt,
        "payOnTime": payOnTime,
        "count": count,
        "averagePoints": averagePoints,
        "_id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "firstName": firstName,
        "neighborhoodcode": neighborhoodcode,
        "lastName": lastName,
        "homeNumber": homeNumber,
        "blockNumber": blockNumber,
        "address": address,
        "totalNumberOfUsers": totalNumberOfUsers,
        "neighborhood": neighborhood.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "code": code,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class UserProvider extends ChangeNotifier {
  List<User> _users = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  void set(List<User> vehicles) {
    this._users = vehicles;
    notifyListeners();
  }

  User getByPosition(int position) {
    return this._users[position];
  }

  void updateById(User vehicle) {
    var id = vehicle.id;
    for (var i = 0; i < _users.length; i++) {
      if (id == _users[i].id) {
        _users[i] = vehicle;
        break;
      }
    }
  }

  User findById(String id) {
    for (var i = 0; i < _users.length; i++) {
      if (id == _users[i].id) {
        return _users[i];
      }
    }
  }
}
