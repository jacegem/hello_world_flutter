import 'package:fitness/JumpingJackPart.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';
import 'package:fitness/global.dart' as global;

class JumpingJackSide extends Node {
  JumpingJackSide(bool right, this.onPerformedJumpingJack) {
    // Torso and head
    torso = _createPart('torso.png', const Offset(512.0, 512.0));
    addChild(torso);

    head = _createPart('head.png', const Offset(512.0, 160.0));
    torso.addChild(head);

    if (right) {
      torso.opacity = 0.0;
      head.opacity = 0.0;
      torso.scaleX = -1.0;
    }

    // Left side movable parts
    upperArm = _createPart('upper-arm.png', const Offset(445.0, 220.0));
    torso.addChild(upperArm);
    lowerArm = _createPart('lower-arm.png', const Offset(306.0, 200.0));
    upperArm.addChild(lowerArm);
    hand = _createPart('hand.png', const Offset(215.0, 127.0));
    lowerArm.addChild(hand);
    upperLeg = _createPart('upper-leg.png', const Offset(467.0, 492.0));
    torso.addChild(upperLeg);
    lowerLeg = _createPart('lower-leg.png', const Offset(404.0, 660.0));
    upperLeg.addChild(lowerLeg);
    foot = _createPart('foot.png', const Offset(380.0, 835.0));
    lowerLeg.addChild(foot);

    torso.setPivotAndPosition(Offset.zero);

    neutralPosition(false);
  }

  JumpingJackPart torso;
  JumpingJackPart head;
  JumpingJackPart upperArm;
  JumpingJackPart lowerArm;
  JumpingJackPart hand;
  JumpingJackPart lowerLeg;
  JumpingJackPart upperLeg;
  JumpingJackPart foot;

  final VoidCallback onPerformedJumpingJack;

  JumpingJackPart _createPart(String textureName, Offset pivotPosition) {
    //todo: _sprites 글로벌로 만들기
    return new JumpingJackPart(global.sprites[textureName], pivotPosition,
        name: textureName);
  }

  void animateJumping() {
    actions.stopAll();
    actions.run(new ActionSequence(<Action>[
      _createPoseAction(null, 0, 0.5),
      new ActionCallFunction(_animateJumpingLoop)
    ]));
  }

  void _animateJumpingLoop() {
    actions.run(new ActionRepeatForever(new ActionSequence(<Action>[
      _createPoseAction(0, 1, 0.3),
      _createPoseAction(1, 2, 0.3),
      _createPoseAction(2, 1, 0.3),
      _createPoseAction(1, 0, 0.3),
      new ActionCallFunction(() {
        if (onPerformedJumpingJack != null) onPerformedJumpingJack();
      })
    ])));
  }

  void neutralPosition(bool animate) {
    actions.stopAll();
    if (animate) {
      //todo: _createPoseAction 만들기
      actions.run(_createPoseAction(null, 1, 0.5));
    } else {
      //todo: _dataForPose 만들기
      List<double> d = _dataForPose(1);
      upperArm.rotation = d[0];
      lowerArm.rotation = d[1];
      hand.rotation = d[2];
      upperLeg.rotation = d[3];
      lowerLeg.rotation = d[4];
      foot.rotation = d[5];
      torso.position = new Offset(0.0, d[6]);
    }
  }

  ActionInterval _createPoseAction(
      int startPose, int endPose, double duration) {
    List<double> d0 = _dataForPose(startPose);
    List<double> d1 = _dataForPose(endPose);

    List<ActionTween> tweens = <ActionTween>[
      _tweenRotation(upperArm, d0[0], d1[0], duration),
      _tweenRotation(lowerArm, d0[1], d1[1], duration),
      _tweenRotation(hand, d0[2], d1[2], duration),
      _tweenRotation(upperLeg, d0[3], d1[3], duration),
      _tweenRotation(lowerLeg, d0[4], d1[4], duration),
      _tweenRotation(foot, d0[5], d1[5], duration),
      new ActionTween<Offset>((a) => torso.position = a, new Offset(0.0, d0[6]),
          new Offset(0.0, d1[6]), duration),
    ];

    return new ActionGroup(tweens);
  }

  ActionTween _tweenRotation(
      JumpingJackPart part, double r0, double r1, double duration) {
    return new ActionTween((a) => part.rotation = a, r0, r1, duration);
  }

  List<double> _dataForPose(int pose) {
    if (pose == null) return _dataForCurrentPose();

    if (pose == 0) {
      return <double>[
        -80.0, // Upper arm rotation
        -30.0, // Lower arm rotation
        -10.0, // Hand rotation
        -15.0, // Upper leg rotation
        5.0, // Lower leg rotation
        15.0, // Foot rotation
        0.0 // Torso y offset
      ];
    } else if (pose == 1) {
      return <double>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -70.0];
    } else {
      return <double>[40.0, 30.0, 10.0, 20.0, -20.0, 15.0, 40.0];
    }
  }

  List<double> _dataForCurrentPose() {
    return <double>[
      upperArm.rotation,
      lowerArm.rotation,
      hand.rotation,
      upperLeg.rotation,
      lowerLeg.rotation,
      foot.rotation,
      torso.position.dy
    ];
  }
}
