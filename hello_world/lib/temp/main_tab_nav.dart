import 'package:flutter/material.dart';

class MainTabNav extends StatefulWidget {
  static const String ROUTE = '/maintab';

  @override
  State<StatefulWidget> createState() {
    return _MainTabNavState();
  }
}

class _MainTabNavState extends State<MainTabNav>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    new Tab(
      text: 'LEFT',
      icon: Icon(Icons.menu),
    ),
    new Tab(text: 'RIGHT'),
  ];

  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    print('tabIndexChanging:${_tabController.indexIsChanging}');
    print('tabIndex:${_tabController.index}');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('BottomNavigationBar Sample'),
      // ),
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

  @override
  Widget build2(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            new Scaffold(
              appBar: AppBar(
                title: Text('in tab'),
              ),
              body: Container(color: Colors.yellow),
            ),
            new Container(
              color: Colors.orange,
            ),
            new Container(
              color: Colors.lightGreen,
            ),
            new Container(
              color: Colors.red,
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0, // this will be set when a new tab is tapped
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: new Icon(Icons.home),
        //       title: new Text('Home'),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: new Icon(Icons.mail),
        //       title: new Text('Messages'),
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.person), title: Text('Profile'))
        //   ],
        // ),
        bottomNavigationBar: new TabBar(
          tabs: myTabs,
          controller: _tabController,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.label,
          // indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
