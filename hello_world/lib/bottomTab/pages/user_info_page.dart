import 'package:flutter/material.dart';
import '../blocs/user_bloc.dart';
import '../blocs/bloc_provider.dart';
import '../models/user.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User info Page'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Text('user info page'),
          RaisedButton(
            child: Text('save'),
            onPressed: () {
              _userBloc.saveInfoSink.add('my firstname');
            },
          )
        ],
      )),
    );
  }
}
