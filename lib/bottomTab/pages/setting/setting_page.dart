import 'package:flutter/material.dart';
import '../../blocs/user_bloc.dart';
import '../../blocs/bloc_provider.dart';
import '../../models/user.dart';
import 'dart:convert';

class SettingPage extends StatelessWidget {
  // return StreamBuilder(
  //   stream: _userBloc.userStream,
  //   initialData: User(status: User.LOADING),22
  //   builder: (BuildContext context, AsyncSnapshot<User> snapshot) {

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    // return StreamBuilder(
    //   stream: _userBloc.userStream,
    //   initialData: User(status: User.LOADING),
    //   builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
    //     return Container();
    //   },
    // );

    return StreamBuilder(
        stream: _userBloc.userStream,
        initialData: _userBloc.initial(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          print('snapshot ${snapshot}');
          return Scaffold(
            appBar: AppBar(
              title: Text('설정'),
            ),
            body: ListView(
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.branding_watermark),
                      title: Text('fn: ${snapshot.data.firstName}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('email@gmail.com'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('010-0101-0101'),
                    ),
                  ],
                )),
                Card(child: Text('body settings page')),
                Card(child: Text('body settings page')),
                RaisedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    _userBloc.userLoginSink.add('why?');
                  },
                )
              ],
            ),
          );
        });
  }
}
