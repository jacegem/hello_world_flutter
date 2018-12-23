import 'package:flutter/material.dart';
import './navs/auth_loading_page.dart';
import './pages/login_page.dart';
import './pages/email_confirm_page.dart';
import './pages/main_tab_page.dart';
import './blocs/bloc_provider.dart';
import './blocs/user_bloc.dart';
import './pages/loading_page.dart';

class BottomTabApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    AuthLoadingNav.routeName: (BuildContext context) => new AuthLoadingNav(),
    LoginPage.routeName: (BuildContext context) => new LoginPage(),
    EmailConfirmPage.routeName: (BuildContext context) =>
        new EmailConfirmPage(),
    MainTabPage.routeName: (BuildContext context) => new MainTabPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Flat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
        ),
        home: BlocProvider<UserBloc>(
          bloc: UserBloc(),
          child: new AuthLoadingNav(),
        ),
        routes: routes);
  }
}
