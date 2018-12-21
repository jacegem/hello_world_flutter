import 'package:flutter/material.dart';

// https://github.com/GeekyAnts/FlatApp-Flutter/blob/master/lib/Routes.dart
// https://github.com/nisrulz/flutter-examples/blob/master/navigation_drawer/lib/main.dart

import 'package:hello_world_flutter/screens/settings.dart';
import 'screens/home.dart';
import 'screens/account.dart';
import 'screens/home.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
    AccountScreen.routeName: (BuildContext context) => new AccountScreen(),
    HomeScreen.routeName: (BuildContext context) => new HomeScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Flutter Flat App',
      home: new HomeScreen(),
      routes: routes,
    ));
  }
}
