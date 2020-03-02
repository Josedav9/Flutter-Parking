import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:parking/contants.dart';

class RegisterPage extends StatelessWidget {
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _name = TextEditingController();
  final _lastName = TextEditingController();
  final _code = TextEditingController();
  final _blockNumber = TextEditingController();
  final _homeNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _simpleValidation(value) {
    if (value.isEmpty) {
      return 'Por favor llene este campo';
    }
    return null;
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      var url = REQUEST_URL + SIGN_UP;
      var formData = {
        'roles': ["ROLE_USER_ACCESS"],
        'username': this._userName.text,
        'password': this._password.text,
        'email': this._email.text,
        'phone': this._phoneNumber.text,
        'firstName': this._name.text,
        'neighborhoodcode': this._code.text,
        'lastName': this._lastName.text,
        'blockNumber': this._blockNumber.text,
        'homeNumber': this._homeNumber.text,
        'enabled': true
      };
      try {
        var response = await http.post(url,
            body: jsonEncode(formData),
            headers: {"Content-Type": "application/json"});
        if (response.statusCode >= 400) {
          throw new ErrorDescription(response.body);
        } else {
          this._userName.clear();
          this._password.clear();
          this._email.clear();
          this._phoneNumber.clear();
          this._name.clear();
          this._code.clear();
          this._lastName.clear();
          this._blockNumber.clear();
          this._homeNumber.clear();
          Navigator.pop(context);
        }
      } catch (e) {
        print("[Login Error] $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Registro'),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nombre de usuario",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _userName,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    obscureText: true,
                    controller: _password,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Correo",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Numero de Telefono",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _phoneNumber,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nombre",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _name,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Apellido",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _lastName,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Codigo del barrio",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _code,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Numero del bloque",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _blockNumber,
                    validator: _simpleValidation,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]))),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Numbero de apartamento",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _homeNumber,
                    validator: _simpleValidation,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () => _submitForm(context),
                  child: Text('Registrarse'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
