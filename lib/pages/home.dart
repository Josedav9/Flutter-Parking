import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:parking/contants.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/pages/register.dart';


class HomePage extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _userPassword = TextEditingController();
  final url = REQUEST_URL+SIGN_IN;

  void _submitData() async {
    String userName = _userNameController.text;
    String userPassword = _userPassword.text;
    var body = {'username': userName, 'password': userPassword};
    try {
      var response = await http.post(url, body: body);
      if(response.statusCode > 399){
        throw new ErrorDescription(response.body);
      }else{
        // TODO: Add the user token to persist inside the provider
        var userData = UserData.fromJson(json.decode(response.body));
        print(userData.user.firstName);
      }
    } catch (e) {
      print("[Login Error] $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[900], Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            elevation: 20,
            margin: EdgeInsets.all(50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de Usuario',
                      icon: Icon(Icons.person),
                    ),
                    controller: _userNameController,
                    keyboardType: TextInputType.text,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña', icon: Icon(Icons.vpn_key)),
                    controller: _userPassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSubmitted: (_) => _submitData(),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Iniciar Sesion'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: _submitData,
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Registarse"),
                    textColor: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
