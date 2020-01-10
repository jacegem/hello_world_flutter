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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                width: 100,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.yellow,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.greenAccent,
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
