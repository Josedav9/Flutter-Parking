import 'package:flutter/material.dart';
import 'package:parking/shared/drawer_navigation.dart';

class AdminEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parqueaderos'),
      ),
      drawer: DrawerNavigation(),
    );
  }
}