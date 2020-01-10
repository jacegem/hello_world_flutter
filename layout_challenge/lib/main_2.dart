import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SafeArea(
        child: Container(
          color: Colors.yellow,
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                color: Colors.red,
              ),
              Expanded(
                child: Container(
                  color: Colors.teal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
