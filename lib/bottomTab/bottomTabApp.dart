import 'package:flutter/material.dart';
import './navs/auth_loading_nav.dart';
import './navs/main_tab_nav.dart';
import './pages/login_page.dart';
import './pages/email_confirm_page.dart';
import './blocs/bloc_provider.dart';
import './blocs/user_bloc.dart';
import './blocs/admin_bloc.dart';
import './blocs/check_bloc.dart';
import './blocs/plan_bloc.dart';
import './pages/loading_page.dart';
import './pages/check/check_page.dart';
import './pages/check/check_history_page.dart';

class BottomTabApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    AuthLoadingNav.ROUTE: (BuildContext context) => new AuthLoadingNav(),
    MainTabNav.ROUTE: (BuildContext context) => new MainTabNav(),
    LoginPage.ROUTE: (BuildContext context) => new LoginPage(),
    EmailConfirmPage.ROUTE: (BuildContext context) => new EmailConfirmPage(),
    CheckPage.ROUTE: (BuildContext context) => new CheckPage(),
    CheckHistoryPage.ROUTE: (BuildContext context) => new CheckHistoryPage(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanBloc>(
      bloc: PlanBloc(),
      child: BlocProvider<CheckBloc>(
        bloc: CheckBloc(),
        child: BlocProvider<AdminBloc>(
          bloc: AdminBloc(),
          child: BlocProvider<UserBloc>(
            bloc: UserBloc(),
            child: new MaterialApp(
                title: 'Flutter Flat App',
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.deepOrange,
                  primaryColor: Colors.lightBlue[800],
                  accentColor: Colors.blueAccent,
                ),
                home: new AuthLoadingNav(),
                routes: routes),
          ),
        ),
      ),
    );
  }
}
