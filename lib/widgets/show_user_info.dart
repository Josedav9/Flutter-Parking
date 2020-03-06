import 'package:flutter/material.dart';
import 'package:parking/models/User.dart';

class ShowUserInfo extends StatelessWidget {
  final User user;

  ShowUserInfo(this.user);

  Widget warningBanner() {
    return Container(
      height: 60,
      color: Colors.amber[100],
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(Icons.warning),
          SizedBox(
            width: 20,
          ),
          Text(
            "El usuario tiene una deuda de  \$${user.debt}",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          user.debt != null ? warningBanner() : '',
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: user.firstName,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nombre",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: user.lastName,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Apellido",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: user.email,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Correo",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: "Telefono: ${user.phone}",
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Numero de Telefono",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: "Numero del bloque: ${user.blockNumber}",
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Numero del bloque",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[100]))),
            child: TextFormField(
              initialValue: "Numbero de apartamento: ${user.homeNumber}",
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Numbero de apartamento",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
