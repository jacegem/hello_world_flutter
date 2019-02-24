import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/global.dart' as g;

class Ray extends Sprite {
  double _rotationSpeed;
  double maxOpacity;

  Ray() : super.fromImage(g.images['assets/ray.png']) {
    pivot = const Offset(0.0, 0.5);
    transferMode = BlendMode.plus;
    rotation = randomDouble() * 360.0;
    maxOpacity = randomDouble() * 0.2;
    opacity = maxOpacity;
    scaleX = 2.5 * randomDouble();
    scaleY = 0.3;
    _rotationSpeed = randomSignedDouble() * 2.0;

    // Scale animation
    double scaleTime = randomSignedDouble() * 2.0 + 4.0;

    actions.run(new ActionRepeatForever(new ActionSequence(<Action>[
      new ActionTween((a) => scaleX = a, scaleX, scaleX * 0.5, scaleTime),
      new ActionTween((a) => scaleX = a, scaleX * 0.5, scaleX, scaleTime)
    ])));
  }

  @override
  void update(double dt) {
    rotation += dt * _rotationSpeed;
  }
}
