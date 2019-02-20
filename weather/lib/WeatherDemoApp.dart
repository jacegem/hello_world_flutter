import 'package:flutter/material.dart';
import 'package:weather/WeatherDemo.dart';

class WeatherDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weather Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new WeatherDemo(),
    );
  }
}
