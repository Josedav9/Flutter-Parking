import 'package:flutter/material.dart';
import 'package:parking/models/User.dart';
import 'package:parking/models/UserVehicles.dart';
import 'package:parking/widgets/show_user_info.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';
import 'package:parking/shared/drawer_navigation.dart';
import 'package:parking/shared/create_edit_car.dart';

class AdminHome extends StatelessWidget {
  _showUserInfo(BuildContext ctx, User user) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: ShowUserInfo(user),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final users = Provider.of<UserProvider>(context);
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
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (users.users != null && index < users.users.length)
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    onTap: () {
                        _showUserInfo(context, users.getByPosition(index));
                      },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: users.getByPosition(index).debt != null
                          ? Colors.amber
                          : Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: users.getByPosition(index).debt != null
                              ? Icon(Icons.warning, color: Colors.black,)
                              : Text(
                                  "${users.getByPosition(index).firstName.substring(0, 1)}"),
                        ),
                      ),
                    ),
                    title: Text(
                        "${users.getByPosition(index).firstName} ${users.getByPosition(index).lastName}"),
                    subtitle: Text(
                        "Bloque: ${users.getByPosition(index).blockNumber}, Apartamento: ${users.getByPosition(index).homeNumber}"),
                    trailing: Switch(
                        value: users.getByPosition(index).enabled,
                        onChanged: (bool value) {
                          print(value);
                        }),
                  ),
                );
            }),
          )
        ],
      ),
    );
  }
}
