import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
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
                child: Text(
                    user.getUser.username.substring(0, 1).toUpperCase() +
                        user.getUser.lastName.substring(0, 1).toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
