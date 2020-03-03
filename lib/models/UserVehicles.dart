import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:parking/models/Vehicle.dart';

class UserVehicles extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<Vehicle> _vehicles = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Vehicle> get vehicles => UnmodifiableListView(_vehicles);

  void set(List<Vehicle> vehicles) {
    this._vehicles = vehicles;
    notifyListeners();
  }

  /// Adds [Vehicle] to cart. This is the only way to modify the cart from outside.
  void add(Vehicle vehicle) {
    _vehicles.add(vehicle);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Vehicle getByPosition( int position ) {
    return this._vehicles[position];
  }

  void updateById( Vehicle vehicle ) {
    var id = vehicle.id;
    for (var i = 0; i < _vehicles.length; i++) {
      if(id == _vehicles[i].id){
        vehicles[i] = vehicle;
        break;
      }
    }
  }

}