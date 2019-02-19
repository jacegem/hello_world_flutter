import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  String text;
  HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                fontFamily: 'Gaegu'),
          ),
        ],
      ),
    );
  }
}
