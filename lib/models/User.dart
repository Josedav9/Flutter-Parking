import 'package:parking/models/Neighborhood.dart';

class User {
  List<String> roles;
  int points;
  String id;
  String username;
  String email;
  String phone;
  String firstName;
  String neighborhoodcode;
  String lastName;
  bool enabled;
  Neighborhood neighborhood;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User({
    this.roles,
    this.points,
    this.id,
    this.username,
    this.email,
    this.phone,
    this.firstName,
    this.neighborhoodcode,
    this.lastName,
    this.enabled,
    this.neighborhood,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        roles: List<String>.from(json["roles"].map((x) => x)),
        points: json["points"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        firstName: json["firstName"],
        neighborhoodcode: json["neighborhoodcode"],
        lastName: json["lastName"],
        enabled: json["enabled"],
        neighborhood: Neighborhood.fromJson(json["neighborhood"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "points": points,
        "_id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "firstName": firstName,
        "neighborhoodcode": neighborhoodcode,
        "lastName": lastName,
        "enabled": enabled,
        "neighborhood": neighborhood.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
