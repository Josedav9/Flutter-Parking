import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';

class DrawerNavigation extends StatelessWidget {
  final routesByRol = {
    'ROLE_ADMINISTRATION_ACCESS': [
      ['Listar Usuarios', 'admin-home'],
      ['Parqueaderos', 'admin-edit'],
      ['Web View', 'web-view']
    ],
    'ROLE_USER_ACCESS': [
      ['Autos', 'home']
    ]
  };

  List<Widget> userRoutes(String rol, BuildContext ctx) {
    List<Widget> userRoutes = [];
    for (var item in routesByRol[rol]) {
      var newItem = ListTile(
        title: Text(
          item[0],
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
        onTap: () {
          Navigator.of(ctx).pushReplacementNamed(item[1]);
        },
      );
      userRoutes.add(newItem);
    }
    return userRoutes;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final loggedUser = user.getUser;
    final loggedUserRole = loggedUser.roles[0];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[900], Colors.lightBlue],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue[50],
                child: Text(loggedUser.firstName.substring(0, 1).toUpperCase()),
              ),
            ),
          ),
          ...userRoutes(loggedUserRole, context),
          ListTile(
            title: Text(
              'Cerrar Sesion',
              style: TextStyle(fontSize: 16, color: Colors.red[300]),
            ),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('login'));
            },
          ),
        ],
      ),
    );
  }
}
