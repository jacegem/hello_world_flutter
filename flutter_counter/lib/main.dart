import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/screens/dashboard.dart';
import 'package:flutter_counter/screens/intro.dart';
import 'package:flutter_counter/screens/splash.dart';

import 'blocs/counter_bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppSate();
}

class _AppSate extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash',
      routes: <String, WidgetBuilder>{
        'splash': (context) => Splash(),
        'intro': (context) => Intro(),
        'dashboard': (context) => DashBoard(),
      },
      home: Scaffold(
        appBar: AppBar(),
        body: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ),
      ),
    );
  }
}
