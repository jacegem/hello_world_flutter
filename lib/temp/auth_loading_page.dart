import 'package:flutter/material.dart';
import '../blocs/user_bloc.dart';
import '../blocs/bloc_provider.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/sample.dart';

class AuthLoadingPage extends StatelessWidget {
  static const String routeName = "/authloading";

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    String _text = '';

    return StreamBuilder(
      stream: _userBloc.userStream,
      initialData: User(),
      builder: (BuildContext context, AsyncSnapshot<User> snaphot) {
        
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('app bar'),
        ),
        body: StreamBuilder(
            stream: _userBloc.userStream,
            initialData: User(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              var _data = snapshot.data;

              if (_data.token == null) {
                return MaterialPageRoute(
                    builder: (BuildContext context) => Sample());

                // {
                // return Container(
                //   child: ListView(
                //     children: <Widget>[
                //       Text('auth loading...'),
                //       Text('email: ${snapshot.data.email}'),
                //       TextField(
                //         onChanged: (String value) {
                //           _text = value;
                //         },
                //       ),
                //       RaisedButton(
                //         child: Text('load'),
                //         onPressed: () {
                //           // _userBloc.userSink.add(User('first email'));
                //         },
                //       ),
                //       RaisedButton(
                //           child: Text('save'),
                //           onPressed: () async {
                //             // _userBloc.userSink.add(User('second email'));
                //             User _user = User(token: 'hello');
                //             SharedPreferences prefs =
                //                 await SharedPreferences.getInstance();
                //             prefs.setString(UserBloc.USER_KEY,
                //                 json.encode(_user.toJson()));
                //             _userBloc.userSink.add(_user);
                //           }),
                //       RaisedButton(
                //         child: Text('delete'),
                //         onPressed: () async {
                //           // _userBloc.userSink.add(User('second email'));
                //           SharedPreferences prefs =
                //               await SharedPreferences.getInstance();
                //           prefs.remove(UserBloc.USER_KEY);
                //           User _user = User();
                //           _userBloc.userSink.add(_user);
                //         },
                //       )
                //     ],
                //   ),
                // );
                // });
              } else if (_data.firstName == null) {
                return Container(child: Text('firstname is null'));
              } else {
                return Container(
                    child: Text('OK enjoy it : ${_data.firstName}'));
              }
            }));
  }
}
