import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';
import 'package:parking/models/Position.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/provider/api.dart';
import 'package:provider/provider.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

class ParkingManager extends StatelessWidget {
  final _search = TextEditingController();
  final ParkingSpace parking;

  ParkingManager({this.parking});

  _lookForVehicle(UserData user, PositionProvider position, BuildContext ctx) async {
    if (_search.text != "") {
      var response = await Api().getVehicleByPlate(user.token, _search.text);
      if (response != null) {
        var favoritePosition = position.getByPosition(
          response.favoriteposition,
          response.vehicletype,
        );
        if (favoritePosition != null) {
          position.setPosition([favoritePosition]);
        } else {
          _showAlertDialog(ctx, "Parece que la placa que ingresaste no tiene una un espacio favorito");
          _search.clear();
          position.setPosition(this.parking.positions);
        }
      } else {
        _showAlertDialog(ctx, "Parece que la placa que ingresaste no existe. Intentalo de nuevo");
        _search.clear();
        position.setPosition(this.parking.positions);
      }
    }
  }

  void _showAlertDialog(BuildContext ctx, String mensaje) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ups!!"),
          content: Text(mensaje),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final user = Provider.of<UserData>(context);
    final positions = Provider.of<PositionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Parking Manager"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          RoundedFloatingAppBar(
            floating: true,
            snap: true,
            title: TextField(
              controller: _search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              onEditingComplete: () => _lookForVehicle(user, positions,context),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var position = positions.getByIndex(index);
              var isAvailable = position.available;
              return GestureDetector(
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: isAvailable == "true"
                            ? Colors.lightBlue[50]
                            : Colors.red[300]),
                    child: Icon(
                      position.vehicletype == "Car"
                          ? Icons.directions_car
                          : position.vehicletype == "Motorcycle"
                              ? Icons.motorcycle
                              : Icons.directions_bike,
                      size: 50,
                    ),
                  ),
                ),
              );
            }, childCount: positions.getSize()),
          ),
        ],
      ),
    );
  }
}
