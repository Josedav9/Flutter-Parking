import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:parking/models/UserResponse.dart';
import 'package:parking/shared/drawer_navigation.dart';

class HomePage extends StatelessWidget {
  static final autos = [
/*     {
      'Tipo de vehiculo': 'Carro',
      'placa': 'asd123',
      'plan': 'days',
      'enabled': true
    },
    {
      'Tipo de vehiculo': 'Carro',
      'placa': 'asd123',
      'plan': 'days',
      'enabled': false
    }, */
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final userInitials = user.getUser.name.substring(0, 1) +
        user.getUser.lastName.substring(0, 1);
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
                  "Bienvenido ${user.getUser.username}",
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
              if (index < autos.length)
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
                            child: Text(userInitials.toUpperCase()),
                          ),
                        ),
                      ),
                      title: Text(autos[index]['placa']),
                      subtitle: Text(autos[index]['plan']),
                      trailing: Switch(
                          value: true,
                          onChanged: (bool value) {
                            print(value);
                          })),
                );
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        ),
    );
  }
}
