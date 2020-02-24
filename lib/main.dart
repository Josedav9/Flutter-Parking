import 'package:flutter/material.dart';

import 'package:parking/widgets/home.dart';
import 'package:parking/widgets/register.dart';

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
