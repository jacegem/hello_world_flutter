import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Drawer(
      child: Container(
        color: themeData.backgroundColor,
      ),
    );
  }
}
