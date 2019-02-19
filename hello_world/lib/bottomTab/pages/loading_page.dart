import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const ROUTE = '/loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Text('loading....'),
    );
  }
}
