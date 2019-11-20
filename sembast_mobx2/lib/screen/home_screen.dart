import 'package:every_hour/store/fruit_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FruitStore _fruitStore; // <--- 클래스 변수 선언

  void _insert() {
    _fruitStore.insert('new fruit', true);
  }

  @override
  Widget build(BuildContext context) {
    _fruitStore = Provider.of<FruitStore>(context); // <--- 스토어 할당

    return Scaffold(
        appBar: AppBar(
          title: Text('main screen'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _fruitStore.insert('in button', false); // <--- 스토어 액션 호출
              },
              child: Text('in button', style: TextStyle(fontSize: 20)),
            ),
            RaisedButton(
              onPressed: _insert,
              child: Text('New Fruit'),
            ),
            Observer(
              builder: (context) =>
                  Text('${_fruitStore.fruitList}'), // <--- 스토어 값 사용
            )
          ],
        ));
  }
}
