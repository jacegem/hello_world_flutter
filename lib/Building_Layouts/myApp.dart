import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ]))
        ],
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Top Lakes3')),
        body: ListView(
          children: [
            Image.asset('images/lake.jpg',
                width: 600.0, height: 240.0, fit: BoxFit.cover),
            titleSection,
          ],
        ),
      ),
    );
  }
}
