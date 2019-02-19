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
  // final _scaffoldKey = LocalKey;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    print('initState() {');

    super.initState();
  }

  @override
  void dispose() {
    print('void dispose() {');
    super.dispose();
  }

  void _login(String email, String password) async {
    UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    print('login attempt: $email with $password');
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('login attempt: $email with $password'),
    ));
    User user = await fetchUserWithEmailPassword(email, password);
    print('user: $user');

    // final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    // Firebase.auth

    _userBloc.loginSink.add('my-new-token');

    // 인증되었으면,
    // Navigator.pushReplacementNamed(context, MainTabNav.ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    print('LoginPage build');

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
      ),
    );
  }
}
