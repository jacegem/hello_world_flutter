import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../services/fetch.dart';
import '../models/user.dart';
import '../navs/main_tab_nav.dart';

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
    print('user: $user');

    // 인증되었으면,
    Navigator.pushReplacementNamed(context, MainTabNav.ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Email Login2'),
        ),
        body: GestureDetector(
          child: LoginForm(_login),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ));
  }
}
