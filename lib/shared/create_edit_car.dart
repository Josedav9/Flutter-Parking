import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/provider/api.dart';

class CreateEditCar extends StatefulWidget {

  final UserData user;

  CreateEditCar(this.user);

  _CreateEditCarState createState() => _CreateEditCarState();
}

class _CreateEditCarState extends State<CreateEditCar> {
  final _formKey = GlobalKey<FormState>();
  final _vehiclePlate = TextEditingController();
  final _favoriteposition = TextEditingController();
  final _brand = TextEditingController();
  final _color = TextEditingController();
  final _plan = TextEditingController();

  String dropdownValue = "";

  String _simpleValidation(value) {
    if (value.isEmpty) {
      return 'Por favor llene este campo';
    }
    return null;
  }

  final OPTIONS = [
    {'value': 'Car', 'text': 'Carro'},
    {'value': 'Bike', 'text': 'Bicicleta'},
    {'value': 'Motorcycle', 'text': 'Motocicleta'},
  ];

  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      var formDate = {
        'vehicletype': dropdownValue,
        'plate': this._vehiclePlate.text,
        'favoriteposition': this._favoriteposition.text,
        'brand':this._brand.text,
        'color':this._color.text,
        'parkingplan':this._plan.text,
        'Datestartplan': _selectedDate.millisecondsSinceEpoch
      };

      Api api = new Api();

      api.addCar(widget.user.getToken, formDate).then((onValue) {
        Navigator.of(context).pop();
        print(onValue);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text (
                    "Ingrese los datos de su vehiculo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: DropdownButton(
                        value: !dropdownValue.isEmpty ? dropdownValue : null,
                        hint: Text("Seleccione el tipo de vehiculo *"),
                        items: OPTIONS.map((Map<String, String> value) {
                          return DropdownMenuItem<String>(
                            value: value['value'],
                            child: Text(value['text']),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            print(newValue);
                            dropdownValue = newValue;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Placa del vehiculo *",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _vehiclePlate,
                        validator: _simpleValidation,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Marca *",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _brand,
                        validator: _simpleValidation,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Color *",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _color,
                        validator: _simpleValidation,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Plan *",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _plan,
                        validator: _simpleValidation,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[100])),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Posicion Favorita",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _favoriteposition,
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _selectedDate == null
                                  ? 'Seleccione una fecha'
                                  : 'Fecha Seleccionada: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}',
                            ),
                          ),
                          FlatButton(
                            child: Text("Fecha del plan"),
                            onPressed: _presentDatePicker,
                            color: Colors.blue,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: _submitForm,
                      child: Text('Guardar'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
