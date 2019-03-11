import 'package:countdown_timer/my_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.blueGrey,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          accentColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
        home: MyApp());
  }
}
