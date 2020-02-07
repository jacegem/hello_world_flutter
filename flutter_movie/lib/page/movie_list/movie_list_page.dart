import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MovieListPage extends StatelessWidget {
  final String title;

  MovieListPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(
        builder: (_) {},
      ),
    );
  }
}
