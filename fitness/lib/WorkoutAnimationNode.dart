import 'package:fitness/JumpingJack.dart';
import 'package:fitness/ProgressCircle.dart';
import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

typedef void SecondPassedCallback(int seconds);

class WorkoutAnimationNode extends NodeWithSize {
  WorkoutAnimationNode({this.onPerformedJumpingJack, this.onSecondPassed})
      : super(const Size(1024.0, 1024.0)) {
    reset();

    _progress = new ProgressCircle(const Size(800.0, 800.0));
    _progress.pivot = const Offset(0.5, 0.5);
    _progress.position = const Offset(512.0, 512.0);
    addChild(_progress);

    _jumpingJack = new JumpingJack(() {
      onPerformedJumpingJack();
    });

    _jumpingJack.scale = 0.5;
    _jumpingJack.position = const Offset(512.0, 512.0);
    addChild(_jumpingJack);
  }

  final VoidCallback onPerformedJumpingJack;
  final SecondPassedCallback onSecondPassed;
  int seconds;
  bool workingOut;
  static const int _kTargetMillis = 1000 * 30;
  int _startTimeMillis;

  ProgressCircle _progress;
  JumpingJack _jumpingJack;

  void reset() {
    seconds = 0;
    workingOut = false;
  }

  void start() {
    reset();
    _startTimeMillis = new DateTime.now().millisecondsSinceEpoch;
    workingOut = true;
    _jumpingJack.animateJumping();
  }

  void stop() {
    workingOut = false;
    _jumpingJack.neutralPose();
  }

  @override
  void update(double dt) {
    if (workingOut) {
      int millis = new DateTime.now().millisecondsSinceEpoch - _startTimeMillis;
      int newSeconds = (millis) ~/ 1000;
      if (newSeconds != seconds) {
        seconds = newSeconds;
        onSecondPassed(seconds);
      }

      _progress.value = millis / _kTargetMillis;
    } else {
      _progress.value = 0.0;
    }
  }
}
