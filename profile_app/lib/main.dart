import 'package:flutter/material.dart';
import 'package:profile_app/main_menu.dart';
import 'package:profile_app/models.dart';
import 'package:profile_app/profile_colors.dart';
import 'package:profile_app/profile_header.dart';
import 'package:profile_app/profile_icons.dart';
import 'package:profile_app/quick_actions.dart';

void main() => runApp(new ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Challenge',
      home: new ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFFCCCCCC);
    final navigationItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.home, color: iconColor), title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.bookmark, color: iconColor),
          title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.thumbsUp, color: iconColor),
          title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.user, color: iconColor), title: Text("")),
    ];

    final profile = getProfile();

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          ProfileHeader(profile),
          QuickActions(),
          MainMenu(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: 0,
          items: navigationItems,
          onTap: (index) {},
          fixedColor: ProfileColors.primaryColor,
          iconSize: 25.0,
          type: BottomNavigationBarType.fixed),
    );
  }
}
