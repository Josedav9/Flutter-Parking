import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class PositionProvider extends ChangeNotifier {
  List<Position> _positions = [];

  UnmodifiableListView<Position> get positions =>
      UnmodifiableListView(_positions);

  void setPosition(List<Position> positions) {
    this._positions = positions;
    notifyListeners();
  }

  int getSize() {
    return this._positions.length;
  }

  Position getByIndex(int index) {
    return _positions[index];
  }

  void updateById(Position position) {
    for (var i = 0; i < _positions.length; i++) {
      if(_positions[i].id == position.id) {
        _positions[i] = position;
        break;
      }
    }
    notifyListeners();
  }

  Position getById(String id) {
    for (var item in _positions) {
      if (item.id == id) {
        return item;
      }
    }
  }

  Position getByPosition(String posnumber, String vehicleType) {
    for (var item in _positions) {
      if (item.posnumber == posnumber) {
        if (vehicleType == item.vehicletype) {
          return item;
        }
        break;
      }
    }
  }

  Position getByPositionNoCheck(String posnumber) {
    for (var item in _positions) {
      if (item.posnumber == posnumber) {
        return item;
      }
    }
  }
}
