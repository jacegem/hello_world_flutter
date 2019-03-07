import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:with_firebase4/curd/crud_sample.dart';
import 'package:with_firebase4/login.dart';
import 'package:with_firebase4/quotes/quotes.dart';
import 'package:with_firebase4/wallpaper/fb.dart';
import 'package:with_firebase4/wallpaper/wall_paper.dart';

// void main() => runApp(new MyApp());
void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  static FirebaseAnalytics analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      new FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.green),
      // home: LoginPage(),
      // home: new WallScreen(
      //   analytics: analytics,
      //   observer: observer,
      // ),
      // home: FirebaseTest(),
      home: QuotesScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      new FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      // home: new WallScreen(analytics: analytics, observer: observer),
      home: new CrudSample(),
    );
  }
}
