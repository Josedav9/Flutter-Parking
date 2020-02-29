import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.getUser.name),
      ),
      drawer: Drawer(
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
                  child: Text("JA"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[900], Colors.lightBlue],
          ),
        ),
      ),
    );
  }
}
