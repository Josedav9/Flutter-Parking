import 'package:parking/models/Neighborhood.dart';

class User {
    bool enabled;
    List<String> roles;
    int points;
    bool isVerified;
    bool isOwner;
    String debt;
    bool payOnTime;
    int count;
    int averagePoints;
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
    Neighborhood neighborhood;
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
        debt: json["debt"] ?? -1,
        payOnTime: json["payOnTime"] ?? -1,
        count: json["count"] ?? -1,
        averagePoints: json["averagePoints"] ?? -1,
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
        neighborhood: Neighborhood.fromJson(json["neighborhood"]),
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