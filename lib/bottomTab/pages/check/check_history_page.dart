import 'package:flutter/material.dart';

class CheckHistoryPage extends StatelessWidget {
  static const String ROUTE = '/checkhistory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체크 history'),
      ),
      body: Text('body check history'),
    );
  }
}
