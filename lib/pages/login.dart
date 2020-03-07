import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';
import 'package:parking/models/User.dart';
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

  void _submitData(BuildContext ctx, UserData userProvider,
      UserVehicles vehiclesProvider, UserProvider users, BestUserProvider bestUsers) async {
    String userName = _userNameController.text;
    String userPassword = _userPassword.text;
    Api api = new Api();
    api.login(userName, userPassword).then((user) async {
      userProvider.setToken = user.token;
      userProvider.setUser = user.user;
      var parkingSpaces = Provider.of<ParkingSpaceProvider>(ctx, listen: false);
      try {
        if (user.getUser.roles[0] == 'ROLE_ADMINISTRATION_ACCESS') {
          var responses = await Future.wait(
            [api.getNeighborhoodUsers(user), api.getParkingSpaces(user), api.getBestPointsUsers(user.token)],
          );
          users.set(responses[0]);
          parkingSpaces.set(responses[1]);
          bestUsers.set(responses[2]);
          Navigator.pushNamed(ctx, '/admin-home');
        } else {
          var vehiclesRes = await api.getUserVehicles(user);
          vehiclesProvider.set(vehiclesRes);
          Navigator.pushNamed(ctx, '/home');
        }
      } catch (e) {
        print(e);
      }
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context, listen: false);
    final vehicles = Provider.of<UserVehicles>(context, listen: false);
    final users = Provider.of<UserProvider>(context, listen: false);
    final bestUsers = Provider.of<BestUserProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
              height: height >= 690 ? height * 0.40 : height * 0.50,
              width: width > 700 ? width * 0.30 : width,
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
                    onPressed: () =>
                        _submitData(context, user, vehicles, users, bestUsers),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
