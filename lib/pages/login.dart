import 'package:flutter/material.dart';
import 'package:parking/models/UserVehicles.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';
import 'package:parking/contants.dart';
import 'package:parking/pages/register.dart';
import 'package:parking/provider/api.dart';

class LoginPage extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _userPassword = TextEditingController();
  final url = REQUEST_URL + SIGN_IN;

  void _submitData(BuildContext ctx, UserData userProvider, UserVehicles vehiclesProvider) async {
    String userName = _userNameController.text;
    String userPassword = _userPassword.text;
    Api api = new Api();
    api.login(userName, userPassword).then((user) async{
      userProvider.setToken = user.token;
      userProvider.setUser = user.user;
      try {
        var vehiclesRes = await api.getUserVehicles(user);
        vehiclesProvider.set(vehiclesRes);
      } catch (e) {
      }
      Navigator.pushNamed(ctx, 'home');
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context, listen: false);
    final vehicles = Provider.of<UserVehicles>(context, listen: false);

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
              height: MediaQuery.of(context).size.height * 0.40,
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
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña', icon: Icon(Icons.vpn_key)),
                    controller: _userPassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Iniciar Sesion'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => _submitData(context, user, vehicles),
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
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Registarse Admin"),
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
