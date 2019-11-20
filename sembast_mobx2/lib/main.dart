import 'package:every_hour/screen/home_screen.dart';
import 'package:every_hour/store/fruit_store.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FruitStore>(builder: (_) => FruitStore()),
          // Provider<SearchStore>(builder: (_) => SearchStore()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            backgroundColor: Colors.grey,
          ),
          home: HomeScreen(),
          // home: SearchResultScreen(),
        ));
  }
}
