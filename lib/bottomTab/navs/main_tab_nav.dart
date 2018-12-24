import 'package:flutter/material.dart';

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
    Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Text('Index 0: Home'),
    ),
    Text('Index 1: Business'),
    Text('Index 2: School'),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
