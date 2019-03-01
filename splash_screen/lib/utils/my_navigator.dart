import 'package:flutter/material.dart';
import 'package:splash_screen/pages/home_screen.dart';
import 'package:splash_screen/pages/intro_screen.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, IntroScreen.routeName);
  }
}
