class Position {
    String id;
    String posnumber;
    String available;
    String vehicletype;
    dynamic vehicle;

    Position({
        this.id,
        this.posnumber,
        this.available,
        this.vehicletype,
        this.vehicle,
    });

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        id: json["_id"],
        posnumber: json["posnumber"],
        available: json["available"],
        vehicletype: json["vehicletype"],
        vehicle: json["vehicle"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "posnumber": posnumber,
        "available": available,
        "vehicletype": vehicletype,
        "vehicle": vehicle,
    };
}