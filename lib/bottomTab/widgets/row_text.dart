import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String title;
  final String time;

  RowText({this.title, this.time = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
