import 'package:fitness/FireworksNode.dart';
import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

class Fireworks extends StatefulWidget {
  Fireworks({Key key}) : super(key: key);
  _FireworksState createState() => _FireworksState();
}

class _FireworksState extends State<Fireworks> {
  @override
  void initState() {
    super.initState();
    fireworks = new FireworksNode();
  }

  FireworksNode fireworks;

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(fireworks);
  }
}
