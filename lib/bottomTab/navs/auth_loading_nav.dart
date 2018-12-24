import 'package:flutter/material.dart';
import '../blocs/user_bloc.dart';
import '../blocs/bloc_provider.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/sample.dart';
import '../pages/login_page.dart';
import '../pages/user_info_page.dart';
import '../pages/loading_page.dart';

class AuthLoadingNav extends StatelessWidget {
  static const String routeName = "/authloading";

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: _userBloc.userStream,
      initialData: User(status: User.LOADING),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        var _data = snapshot.data;
        if (_data.status == User.LOADING) {
          return LoadingPage();
        }
        if (_data.token == null) {
          return LoginPage();
        }
        if (_data.firstName == null) {
          return UserInfoPage();
        }
      },
    );
  }
}
