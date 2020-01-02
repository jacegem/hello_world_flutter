import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget icon;
  final String text;

  const CardWidget({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(text),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    );
  }
}
