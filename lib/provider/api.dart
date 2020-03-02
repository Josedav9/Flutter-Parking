import 'package:flutter/material.dart';
import 'package:parking/contants.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:parking/models/UserResponse.dart';

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
}
