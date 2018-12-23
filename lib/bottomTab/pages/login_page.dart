import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../services/fetch.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _login(String email, String password) async {
    print('login attempt: $email with $password');
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('login attempt: $email with $password'),
    ));
    User user = await fetchUserWithEmailPassword(email, password);
    print('user: ${user}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Email Login'),
        ),
        body: LoginForm(_login));
  }
}
