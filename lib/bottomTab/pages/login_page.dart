import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../services/fetch.dart';
import '../models/user.dart';
import '../navs/main_tab_nav.dart';

import '../blocs/user_bloc.dart';
import '../blocs/bloc_provider.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserBloc _userBloc;

  @override
  initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.dispose();
  }

  void _login(String email, String password) async {
    print('login attempt: $email with $password');
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('login attempt: $email with $password'),
    ));
    User user = await fetchUserWithEmailPassword(email, password);
    print('user: $user');

    // final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.userLoginSink.add(email);

    // 인증되었으면,
    Navigator.pushReplacementNamed(context, MainTabNav.ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: GestureDetector(
          child: LoginForm(_login),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ));
  }
}
