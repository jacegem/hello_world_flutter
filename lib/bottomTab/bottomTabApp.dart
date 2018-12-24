import 'package:flutter/material.dart';
import './navs/auth_loading_nav.dart';
import './navs/main_tab_nav.dart';
import './pages/login_page.dart';
import './pages/email_confirm_page.dart';
import './blocs/bloc_provider.dart';
import './blocs/user_bloc.dart';
import './pages/loading_page.dart';

class BottomTabApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    AuthLoadingNav.routeName: (BuildContext context) => new AuthLoadingNav(),
    MainTabNav.ROUTE: (BuildContext context) => new MainTabNav(),
    LoginPage.routeName: (BuildContext context) => new LoginPage(),
    EmailConfirmPage.routeName: (BuildContext context) =>
        new EmailConfirmPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Flat App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.blueGrey,
          accentColor: Colors.blueAccent,
        ),
        home: BlocProvider<UserBloc>(
          bloc: UserBloc(),
          child: new AuthLoadingNav(),
        ),
        routes: routes);
  }
}
