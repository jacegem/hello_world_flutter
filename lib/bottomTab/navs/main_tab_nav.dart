import 'package:flutter/material.dart';
import '../pages/check/check_page.dart';
import '../pages/setting/setting_page.dart';

class MainTabNav extends StatefulWidget {
  static const String ROUTE = '/maintab';

  @override
  State<StatefulWidget> createState() {
    return _MainTabNavState();
  }
}

class _MainTabNavState extends State<MainTabNav> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    CheckPage(),
    Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Text('Index 0: Home'),
    ),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.check), title: Text('Check')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
