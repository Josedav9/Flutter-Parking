import 'package:parking/models/Position.dart';

class ParkingPosition {
    String parkingname;
    int totalspace;
    List<Position> positions;
    int numberOfCreatePositions;
    int numberOfPosAvailables;

    ParkingPosition({
        this.parkingname,
        this.totalspace,
        this.positions,
        this.numberOfCreatePositions,
        this.numberOfPosAvailables,
    });

    factory ParkingPosition.fromJson(Map<String, dynamic> json) => ParkingPosition(
        parkingname: json["parkingname"],
        totalspace: json["totalspace"],
        positions: List<Position>.from(json["positions"].map((x) => Position.fromJson(x))),
        numberOfCreatePositions: json["NumberOfCreatePositions"],
        numberOfPosAvailables: json["NumberOfPosAvailables"],
    );

    Map<String, dynamic> toJson() => {
        "parkingname": parkingname,
        "totalspace": totalspace,
        "positions": List<dynamic>.from(positions.map((x) => x.toJson())),
        "NumberOfCreatePositions": numberOfCreatePositions,
        "NumberOfPosAvailables": numberOfPosAvailables,
    };
}