import 'package:flutter/material.dart';

final String fontFamily = 'goyang-R';

final Color darkColor = Color(0xFF2d3447);
final Color purpleColor = Colors.blue[300];
final Color amoledColor = Colors.black;

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  final TextTheme textTheme = TextTheme(
    headline: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 24),
    title: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20),
    subhead: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18),
    body1: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 16),
    body2: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontSize: 14),
    caption: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 14),
  );

  return base.copyWith(
    scaffoldBackgroundColor: darkColor,
    primaryColor: darkColor,
    accentColor: purpleColor,
    canvasColor: Colors.transparent,
    highlightColor: darkColor,
    backgroundColor: darkColor,
    splashColor: darkColor,
    cardColor: darkColor.withOpacity(0.3),
    primaryIconTheme: IconThemeData(color: Colors.white),
    focusColor: darkColor,
    appBarTheme: AppBarTheme(
      textTheme: textTheme,
      color: darkColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: textTheme,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
