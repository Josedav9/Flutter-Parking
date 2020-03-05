import 'dart:convert';

import 'package:parking/models/Position.dart';

List<ParkingSpace> parkingSpaceFromJson(String str) => List<ParkingSpace>.from(json.decode(str).map((x) => ParkingSpace.fromJson(x)));

String parkingSpaceToJson(List<ParkingSpace> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParkingSpace {
    bool enabled;
    String id;
    String parkingname;
    int totalspace;
    List<Price> prices;
    List<Position> positions;
    List<Schedule> schedule;
    String neighborhood;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    ParkingSpace({
        this.enabled,
        this.id,
        this.parkingname,
        this.totalspace,
        this.prices,
        this.positions,
        this.schedule,
        this.neighborhood,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory ParkingSpace.fromJson(Map<String, dynamic> json) => ParkingSpace(
        enabled: json["enabled"],
        id: json["_id"],
        parkingname: json["parkingname"],
        totalspace: json["totalspace"],
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        positions: List<Position>.from(json["positions"].map((x) => Position.fromJson(x))),
        schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
        neighborhood: json["neighborhood"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "_id": id,
        "parkingname": parkingname,
        "totalspace": totalspace,
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "positions": List<dynamic>.from(positions.map((x) => x.toJson())),
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
        "neighborhood": neighborhood,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Price {
    String id;
    String kind;
    String value;

    Price({
        this.id,
        this.kind,
        this.value,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["_id"],
        kind: json["kind"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "kind": kind,
        "value": value,
    };
}

class Schedule {
    String id;
    String rank;
    String value;

    Schedule({
        this.id,
        this.rank,
        this.value,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["_id"],
        rank: json["rank"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "rank": rank,
        "value": value,
    };
}
