import 'package:flutter/material.dart';
import 'package:parking/models/ParkingSpace.dart';
import 'package:parking/models/User.dart';
import 'package:parking/models/UserResponse.dart';
import 'package:parking/models/UserVehicles.dart';
import 'package:parking/pages/admin_edit.dart';
import 'package:parking/pages/admin_home.dart';
import 'package:parking/pages/create_edit_parking.dart';
import 'package:parking/pages/register_admin.dart';

import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:parking/pages/login.dart';
import 'package:parking/pages/register.dart';
import 'package:parking/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserData>(
          create: (_) => UserData(),
        ),
        ChangeNotifierProvider<UserVehicles>(
          create: (_) => UserVehicles(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<ParkingSpaceProvider>(
          create: (_) => ParkingSpaceProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('es'),
        ],
        title: 'Parking App',
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPage(),
          'home': (context) => HomePage(),
          'register-admin': (context) => RegisterAdminPage(),
          'admin-home': (context) => AdminHome(),
          'admin-edit': (context) => AdminEditPage(),
        },
      ),
    );
  }
}
