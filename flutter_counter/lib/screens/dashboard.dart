import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 100,
            backgroundImage:
                NetworkImage('https://cdn2.thecatapi.com/images/200.jpg'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Text('Test'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
