import 'package:flutter/material.dart';

import 'package:parking/pages/home.dart';
import 'package:parking/pages/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'register': (context) => RegisterPage()
      },
    );
  }
}
