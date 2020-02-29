import 'package:flutter/material.dart';
import 'package:parking/models/UserResponse.dart';

import 'package:provider/provider.dart';

import 'package:parking/pages/login.dart';
import 'package:parking/pages/register.dart';
import 'package:parking/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        title: 'Parking App',
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPage(),
          'home': (context) => HomePage()
        },
      ),
    );
  }
}
