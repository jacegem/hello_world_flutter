import 'package:fitness/FitnessDemoContents.dart';
import 'package:flutter/material.dart';

class FitnessDemo extends StatelessWidget {
  FitnessDemo({Key key}) : super(key: key);

  static const String routeName = '/fitness';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Fitness')),
        body: new FitnessDemoContents());
  }
}
