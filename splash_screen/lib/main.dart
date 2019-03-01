import 'package:flutter/material.dart';
import 'package:splash_screen/pages/home_screen.dart';
import 'package:splash_screen/pages/intro_screen.dart';
import 'package:splash_screen/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  IntroScreen.routeName: (BuildContext context) => IntroScreen()
};

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    ));
