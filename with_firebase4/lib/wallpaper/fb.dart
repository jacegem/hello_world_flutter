import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseTest extends StatelessWidget {
  // final notesReference = FirebaseDatabase.instance.reference().child('notes');
  final notesReference = FirebaseDatabase.instance.reference().child('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('FB test'),
      ),
      drawer: new Drawer(),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new RaisedButton(
            child: const Text('read'),
            onPressed: () {
              notesReference
                  .orderByChild("email")
                  // .startAt("2019-02-26")
                  // .limitToFirst(1)
                  // .orderByKey()
                  .equalTo("google@gmail.com")
                  .once()
                  .then((DataSnapshot snapshot) {
                final value = snapshot.value as Map;

                for (final key in value.keys) {
                  print("$key : ${value[key]}");
                }
              });

              // notesReference
              //     .equalTo('list')
              //     .once()
              //     .then((DataSnapshot snapshot) {
              //   final value = snapshot.value as Map;
              //   for (final key in value.keys) {
              //     print("$key : ${value[key]}");
              //   }
              // });
              // FirebaseDatabase.instance
              //     .reference()
              //     .child('exercise')
              //     .once()
              //     .then((DataSnapshot snapshot) {
              //   final value = snapshot.value as Map;
              //   for (final key in value.keys) {
              //     print(value[key]);
              //   }
              // });
              // print("rst: $rst");
            },
          ),
          new RaisedButton(
            child: new Text('write'),
            onPressed: () {
              notesReference.child('etc').set({
                'video': ['080d4874-47d9-4f4e-b815-9b8dc9c8a2ba'],
              });
            },
          )
        ],
      ),
    );
  }
}
