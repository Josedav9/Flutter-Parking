import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';
import 'package:parking/pages/create_edit_parking.dart';
import 'package:parking/shared/drawer_navigation.dart';
import 'package:provider/provider.dart';

class AdminEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parkingSpaceProvider = Provider.of<ParkingSpaceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Parqueaderos'),
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => CreateEditParking(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: List.generate(parkingSpaceProvider.spaces?.length, (index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.directions_car),
                  title: Text(
                      parkingSpaceProvider.getByPosition(index).parkingname),
                  subtitle: Text(
                    "Espcios totales: ${parkingSpaceProvider.getByPosition(index).totalspace}, espacio asignados: ${parkingSpaceProvider.getByPosition(index).positions.length}",
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Editar'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CreateEditParking(
                                    parking: parkingSpaceProvider
                                        .getByPosition(index)),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: Text('Acceder'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
