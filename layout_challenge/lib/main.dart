import 'package:flutter/material.dart';
import 'package:layout_challenge/card_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  int num = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
              ),
              Container(
                child: Text("dddd"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.white,
                    )),
              ),
              CardWidget(icon: Icon(Icons.update), text: "sddddd"),
              CardWidget(icon: Icon(Icons.keyboard), text: "keyboard"),
            ],
          ),
        ));
  }
}
