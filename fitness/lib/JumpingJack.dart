import 'package:fitness/JumpingJackSide.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';

class JumpingJack extends Node {
  JumpingJack(VoidCallback onPerformedJumpingJack) {
    left = new JumpingJackSide(false, onPerformedJumpingJack);
    right = new JumpingJackSide(true, null);
    addChild(left);
    addChild(right);
  }

  void animateJumping() {
    left.animateJumping();
    right.animateJumping();
  }

  void neutralPose() {
    left.neutralPosition(true);
    right.neutralPosition(true);
  }

  JumpingJackSide left;
  JumpingJackSide right;
}
