import 'package:flutter/material.dart';
import 'package:parking/models/User.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/shared/drawer_navigation.dart';
import 'package:provider/provider.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final bestUsers = Provider.of<BestUserProvider>(context);

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
                  "Mejores Usuarios",
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
              if (index < bestUsers.users.length)
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.star),
                        ),
                      ),
                    ),
                    title: Text(bestUsers.getByPosition(index).firstName),
                    subtitle: Text(
                        "Puntos conseguidos ${bestUsers.getByPosition(index).averagePoints}"),
                    trailing: Switch(
                        value: true,
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
