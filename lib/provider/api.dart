import 'package:flutter/material.dart';
import 'package:parking/contants.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:parking/models/UserResponse.dart';
import 'package:parking/models/UserVehicles.dart';
import 'package:parking/models/Vehicle.dart';

class Api {
  Future<UserData> login(String userName, String password) async {
    try {
      var data = {'username': userName, 'password': password};
      var response = await http.post(REQUEST_LOGIN,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode >= 400) {
        throw new ErrorDescription(response.body);
      } else {
        print(response.body);
        return new Future.value(UserData.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      print("[Login Error] $e");
      return new Future.error(e);
    }
  }

  Future<Vehicle> addCar(String token, Map<String, dynamic> datos) async {
    try {
      print(datos);
      var response = await http.post(
        REQUEST_VEHICLES,
        body: jsonEncode(datos),
        headers: {"Content-Type": "application/json", "Authorization": token},
      );
      if (response.statusCode >= 400) {
        throw new ErrorDescription(response.body);
      } else {
        print(response.body);
        var vehicles = Vehicle.fromJson(json.decode(response.body));
        return new Future.value(vehicles);
      }
    } catch (e) {
      print("[addVehicle Error] $e");
      return new Future.error(e);
    }
  }

  Future<List<Vehicle>> getUserVehicles(UserData user) async {
    try {
      var response = await http.get(REQUEST_VEHICLES, headers: {
        "Content-Type": "application/json",
        "Authorization": user.getToken
      });
      if (response.statusCode >= 400) {
        throw new ErrorDescription(response.body);
      } else {
        var algo = vehicleFromJson(response.body);
        return new Future.value(algo);
      }
    } catch (e) {
      print("[getUserVehicle Error] $e");
      return new Future.error(e);
    }
  }
}
