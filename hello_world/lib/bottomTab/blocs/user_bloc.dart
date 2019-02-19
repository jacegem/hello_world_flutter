// https://github.com/NPKompleet/Beatz/blob/master/lib/blocs/albums_page_bloc.dart

import 'dart:async';
import 'dart:io';
import 'dart:collection';

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/status.dart';

class UserBloc extends BlocBase {
  static const String USER_KEY = '@user';

  User _user;

  // Stream to handle displaying albums
  BehaviorSubject<User> _userController = BehaviorSubject<User>();
  StreamSink<User> get userSink => _userController.sink;
  Stream<User> get userStream => _userController.stream;

  BehaviorSubject<String> _loginController = BehaviorSubject<String>();
  StreamSink<String> get loginSink => _loginController.sink;

  BehaviorSubject<void> _logoutController = BehaviorSubject<void>();
  StreamSink<void> get logoutSink => _logoutController.sink;

  BehaviorSubject<String> _saveInfoController = BehaviorSubject<String>();
  StreamSink<String> get saveInfoSink => _saveInfoController.sink;

  BehaviorSubject _fetchUserController = BehaviorSubject();
  StreamSink get fetchUserSink => _fetchUserController.sink;

  User initial() {
    return _user;
  }

  UserBloc() {
    // 시작시에, 로컬 asyncstorage에서 가져온다.
    _user = new User(status: Status.LOADING);
    _loadUser();
    // _userController.listen(onData);
    _loginController.stream.listen(_login);
    _logoutController.stream.listen(_logout);
    _saveInfoController.stream.listen(_saveInfo);
    _fetchUserController.stream.listen(fetchUser);
  }

  void _saveInfo(String firstName) {
    _user.firstName = firstName;
    userSink.add(_user);
  }

  void _login(String token) {
    _user.token = token;
    userSink.add(_user);
  }

  void _logout(_) {
    _user.token = null;
    userSink.add(_user);
  }

  void fetchUser(_) {
    userSink.add(new User());
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _json = prefs.get(USER_KEY);

    if (_json != null) {
      Map _userMap = json.decode(_json);
      _user = new User.fromJson(_userMap);
    }

    Future.delayed(const Duration(seconds: 1), () {
      _user.status = Status.LOADED;
      userSink.add(_user);
    });
  }

  @override
  void dispose() {
    _userController.close();
    _fetchUserController.close();
    _loginController.close();
    _logoutController.close();
    _saveInfoController.close();
  }
}
