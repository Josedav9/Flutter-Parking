

import 'package:parking/models/Neighborhood.dart';

class User {
  List<String> roles;
  String id;
  String username;
  String email;
  bool enabled;
  String phone;
  String firstName;
  String neighborhoodcode;
  String points;
  String lastName;
  Neighborhood neighborhood;

  User({
    this.roles,
    this.id,
    this.username,
    this.email,
    this.enabled,
    this.phone,
    this.firstName,
    this.neighborhoodcode,
    this.points,
    this.lastName,
    this.neighborhood,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        roles: List<String>.from(json["roles"].map((x) => x)),
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        enabled: json["enabled"],
        phone: json["phone"],
        firstName: json["firstName"],
        neighborhoodcode: json["neighborhoodcode"],
        points: json["points"],
        lastName: json["lastName"],
        neighborhood: Neighborhood.fromJson(json["neighborhood"]),
      );

  Map<String, dynamic> toJson() => {
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "_id": id,
        "username": username,
        "email": email,
        "enabled": enabled,
        "phone": phone,
        "firstName": firstName,
        "neighborhoodcode": neighborhoodcode,
        "points": points,
        "lastName": lastName,
        "neighborhood": neighborhood.toJson(),
      };
}
