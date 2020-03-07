import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/provider/api.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class CreateEditParking extends StatelessWidget {
  final ParkingSpace parking;
  final _parkingName = TextEditingController();
  final _totalSpaces = TextEditingController();
  final _cars = TextEditingController();
  final _bikes = TextEditingController();
  final _motorcycles = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CreateEditParking({this.parking}) {
    if (this.parking != null) {
      _parkingName.text = this.parking.parkingname;
      _totalSpaces.text = this.parking.totalspace.toString();
      var cars = 0;
      var bike = 0;
      var motor = 0;
      for (var i = 0; i < this.parking.positions.length; i++) {
        var position = this.parking.positions[i];
        if (position.vehicletype == "Motorcycle") {
          motor++;
        } else if (position.vehicletype == "Car") {
          cars++;
        } else if (position.vehicletype == "Bike") {
          bike++;
        }
      }
      _cars.text = cars.toString();
      _bikes.text = bike.toString();
      _motorcycles.text = motor.toString();
    }
  }

  String _simpleValidation(value) {
    if (value.isEmpty) {
      return 'Por favor llene este campo';
    }
    return null;
  }

  String parkingName() {
    if (parking?.parkingname != null) {
      return " " + parking.parkingname;
    } else {
      return '.';
    }
  }

  int amountOf(String vehicleType) {
    if (parking == null) {
      return null;
    }
    var counter = 0;
    for (var parking in parking.positions) {
      if (parking.vehicletype == vehicleType) {
        counter++;
      }
    }

    return counter;
  }

  void _submitForm(UserData user, ParkingSpaceProvider parkingProvider,
      BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      var autos = [];
      var motos = [];
      var bicicletas = [];
      var positionsValue = 1;

      if (this.parking != null) {
        for (var i = 0; i < parking.positions.length; i++) {
          var position = parking.positions[i];
          if (position.vehicletype == "Motorcycle") {
            motos.add(position);
          } else if (position.vehicletype == "Car") {
            autos.add(position);
          } else if (position.vehicletype == "Bike") {
            bicicletas.add(position);
          }
        }

        positionsValue = parking.positions.length;
      }

      if (autos.length > int.parse(this._cars.text)) {
        autos.removeLast();
      }
      if (bicicletas.length > int.parse(this._bikes.text)) {
        bicicletas.removeLast();
      }
      if (motos.length > int.parse(this._motorcycles.text)) {
        motos.removeLast();
      }
      if (autos.length < int.parse(this._cars.text)) {
        autos.add({
          "posnumber": positionsValue,
          "available": true,
          "vehicletype": "Car"
        });
        positionsValue++;
      }
      if (bicicletas.length < int.parse(this._bikes.text)) {
        autos.add({
          "posnumber": positionsValue,
          "available": true,
          "vehicletype": "Bike"
        });
        positionsValue++;
      }
      if (motos.length < int.parse(this._motorcycles.text)) {
        autos.add({
          "posnumber": positionsValue,
          "available": true,
          "vehicletype": "Motorcycle"
        });
        positionsValue++;
      }

      var formData = {
        'parkingname': this._parkingName.text,
        'enabled': true,
        'totalspace': this._totalSpaces.text,
        "prices": [
          {"kind": "Minute", "value": "123"},
          {"kind": "Hour", "value": "3232"},
          {"kind": "Day", "value": "9432"}
        ],
        'positions': [...autos, ...motos, ...bicicletas],
        "schedule": [
          {"rank": "Monday to Friday", "value": "6 am to 8 pm"},
          {"rank": "Saturday", "value": "8 am to 6 pm"},
          {"rank": "Sunday", "value": "8 am to 1 pm"}
        ]
      };

      if (this.parking == null) {
        try {
          var response =
              await Api().addParking(user.token, json.encode(formData));
          parkingProvider.add(response);
          Navigator.of(ctx).pop();
        } catch (e) {
          print('[Create Parking] $e');
        }
      }
      else {
        try {
          var response = await Api().updateParking(user.token, json.encode(formData), this.parking.id);
          parkingProvider.updateById(response);
          Navigator.of(ctx).pop();
        } catch (e) {
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final parkingProvider = Provider.of<ParkingSpaceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Parqueadero${parkingName()}'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[100]),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de parqueadero",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _parkingName,
                  validator: _simpleValidation,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[100]),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Total de espacios",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _totalSpaces,
                  validator: _simpleValidation,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[100]),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Carros",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _cars,
                  validator: _simpleValidation,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[100]),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Motos",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _motorcycles,
                  validator: _simpleValidation,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[100]),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Bicicletas",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _bikes,
                  validator: _simpleValidation,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () => _submitForm(user, parkingProvider, context),
                child: Text('Guardar'),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
          key: _formKey,
        ),
      ),
    );
  }
}
