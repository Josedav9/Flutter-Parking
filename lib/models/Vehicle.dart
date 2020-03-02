import 'package:parking/models/User.dart';
import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) => List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

class Vehicle {
    List<dynamic> observations;
    bool enabled;
    String id;
    String vehicletype;
    String plate;
    String favoriteposition;
    String brand;
    String color;
    String parkingplan;
    DateTime datestartplan;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Vehicle({
        this.observations,
        this.enabled,
        this.id,
        this.vehicletype,
        this.plate,
        this.favoriteposition,
        this.brand,
        this.color,
        this.parkingplan,
        this.datestartplan,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        observations: ["Hola"],
        enabled: json["enabled"],
        id: json["_id"],
        vehicletype: json["vehicletype"],
        plate: json["plate"],
        favoriteposition: json["favoriteposition"],
        brand: json["brand"],
        color: json["color"],
        parkingplan: json["parkingplan"],
        datestartplan: DateTime.parse(json["Datestartplan"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "Observations": List<String>.from(observations.map((x) => x)),
        "enabled": enabled,
        "_id": id,
        "vehicletype": vehicletype,
        "plate": plate,
        "favoriteposition": favoriteposition,
        "brand": brand,
        "color": color,
        "parkingplan": parkingplan,
        "Datestartplan": datestartplan.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}