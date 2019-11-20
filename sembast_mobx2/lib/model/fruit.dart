import 'package:flutter/material.dart';

class Fruit {
  int id;

  final String name;
  final bool isSweet;

  Fruit({@required this.name, @required this.isSweet});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSweet': isSweet,
    };
  }

  static Fruit fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'],
      isSweet: map['isSweet'],
    );
  }
}
