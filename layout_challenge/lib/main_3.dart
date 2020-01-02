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
          color: Colors.teal,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(width: 100, color: Colors.red)),
              Align(
                child: Container(width: 100, color: Colors.blue),
                alignment: Alignment.centerRight,
              ),
              Align(
                alignment: Alignment.center,
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
              Positioned(
                top: 200,
                left: 50,
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
