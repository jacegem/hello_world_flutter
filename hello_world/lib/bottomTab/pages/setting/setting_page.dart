import 'package:flutter/material.dart';
import '../../blocs/user_bloc.dart';
import '../../blocs/bloc_provider.dart';
import '../../models/user.dart';
import 'dart:convert';
import '../../navs/auth_loading_nav.dart';
import '../../pages/login_page.dart';
import '../../widgets/header_text.dart';

class SettingPage extends StatelessWidget {
  // return StreamBuilder(
  //   stream: _userBloc.userStream,
  //   initialData: User(status: User.LOADING),22
  //   builder: (BuildContext context, AsyncSnapshot<User> snapshot) {

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: _userBloc.userStream,
        initialData: _userBloc.initial(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('설정'),
            ),
            body: ListView(
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    HeaderText('사용자 정보'),
                    ListTile(
                      leading: Icon(Icons.branding_watermark),
                      title: Text('fn: ${snapshot.data.firstName}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('${snapshot.data.email}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.flight_takeoff),
                      title: Text('${snapshot.data.token}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('010-0101-0102'),
                    ),
                  ],
                )),
                Card(child: Text('body settings page')),
                Card(child: Text('body settings page')),
                RaisedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    // Navigator.pushNamed(context, LoginPage.ROUTE);
                    _userBloc.logoutSink.add(null);
                    // Navigator.pushReplacementNamed(context, LoginPage.ROUTE);
                  },
                )
              ],
            ),
          );
        });
  }
}
