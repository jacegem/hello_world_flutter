// https://github.com/NPKompleet/Beatz/blob/master/lib/blocs/albums_page_bloc.dart

import 'dart:async';
import 'dart:io';
import 'dart:collection';

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserBloc extends BlocBase {
  static const String USER_KEY = '@user';

  User _user;

  // Stream to handle displaying albums
  BehaviorSubject<User> _userController = BehaviorSubject<User>();
  StreamSink<User> get userSink => _userController.sink;
  Stream<User> get userStream => _userController.stream;

  BehaviorSubject<String> _userLoginController = BehaviorSubject<String>();
  StreamSink<String> get userLoginSink => _userLoginController.sink;

  BehaviorSubject _fetchUserController = BehaviorSubject();
  StreamSink get fetchUserSink => _fetchUserController.sink;

  UserBloc() {
    // 시작시에, 로컬 asyncstorage에서 가져온다.
    _user = new User();
    _loadUser();
    // _userController.listen(onData);
    _userLoginController.stream.listen(_userLogin);
    _fetchUserController.stream.listen(fetchUser);
  }

  User initial() {
    return User(firstName: 'init', status: User.LOADING);
  }

  void _userLogin(String email) {
    print(email);
    // _user.firstName = 'my first name';
    userSink.add(new User(firstName: _user.firstName + '!'));
  }

  void fetchUser(_) {
    userSink.add(new User());
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String _json = prefs.get(USER_KEY);

    print('json: $_json');
    User _user;

    if (_json != null) {
      Map _userMap = json.decode(_json);
      _user = new User.fromJson(_userMap);
    } else {
      _user = new User();
    }

    _user.status = User.LOADED;
    Future.delayed(const Duration(seconds: 1), () {
      userSink.add(_user);
    });
  }

  @override
  void dispose() {
    _userController.close();
    _fetchUserController.close();
    _userLoginController.close();
  }
}
