import 'package:flutter/material.dart';
import './products.dart';
import './products_admin.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ));
  }
}
