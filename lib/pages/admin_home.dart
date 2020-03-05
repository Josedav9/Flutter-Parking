import 'package:flutter/material.dart';
import 'package:parking/models/UserVehicles.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';
import 'package:parking/shared/drawer_navigation.dart';
import 'package:parking/shared/create_edit_car.dart';

class AdminHome extends StatelessWidget {

  _addNewCar(BuildContext ctx, UserData user) {
    showModalBottomSheet(
      context: ctx,
      
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: CreateEditCar(user),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final userInitials = user.getUser.firstName.substring(0, 1);
    return Scaffold(
      drawer: DrawerNavigation(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.30,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[900], Colors.lightBlue],
                ),
              ),
              child: Center(
                child: Text(
                  "Bienvenido ${user.getUser.firstName}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewCar(context, user);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
