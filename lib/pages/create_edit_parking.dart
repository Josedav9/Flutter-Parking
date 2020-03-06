import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';

class CreateEditParking extends StatelessWidget {
  final ParkingSpace parking;
  final _parkingName = TextEditingController();
  final _totalSpaces = TextEditingController();
  final _cars = TextEditingController();
  final _bikes = TextEditingController();
  final _motorcycles = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CreateEditParking({this.parking});

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

  void isParking() {
    _parkingName.text = parking.parkingname;
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

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      print(_parkingName.text);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  initialValue: parking?.parkingname ?? null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de parqueadero",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller:
                      parking?.parkingname == null ? _parkingName : null,
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
                  initialValue: parking?.totalspace?.toString() ?? null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Total de espacios",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller:
                      parking?.parkingname == null ? _totalSpaces : null,
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
                  initialValue: amountOf('Car')?.toString() ?? null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Carros",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: parking?.parkingname == null ? _cars : null,
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
                  initialValue: amountOf('Motorcycle')?.toString() ?? null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Motos",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller:
                      parking?.parkingname == null ? _motorcycles : null,
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
                  initialValue: amountOf('Bike')?.toString() ?? null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Bicicletas",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: parking?.parkingname == null ? _bikes : null,
                  validator: _simpleValidation,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () => _submitForm(),
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
