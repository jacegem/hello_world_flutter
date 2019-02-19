import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';

class JumpingJackPart extends Sprite {
  String name;

  JumpingJackPart(SpriteTexture texture, this.pivotPosition, {this.name: ''})
      : super(texture);
  final Offset pivotPosition;

  void setPivotAndPosition(Offset newPosition) {
    pivot = new Offset(pivotPosition.dx / 1024.0, pivotPosition.dy / 1024.0);
    position = newPosition;

    for (Node child in children) {
      JumpingJackPart subPart = child;
      subPart.setPivotAndPosition(new Offset(
          subPart.pivotPosition.dx - pivot.dx,
          subPart.pivotPosition.dy - pivot.dy));
    }
  }
}
