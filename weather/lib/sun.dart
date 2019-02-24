import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/global.dart' as g;
import 'package:weather/ray.dart';

const double _kNumSunRays = 50.0;

// Create an animated sun with rays
class Sun extends Node {
  Sun() {
    // Create the sun
    _sun = new Sprite.fromImage(g.images['assets/sun.png']);
    _sun.scale = 4.0;
    _sun.transferMode = BlendMode.plus;
    addChild(_sun);

    // Create rays
    _rays = <Ray>[];
    for (int i = 0; i < _kNumSunRays; i++) {
      Ray ray = new Ray();
      addChild(ray);
      _rays.add(ray);
    }
  }

  Sprite _sun;
  List<Ray> _rays;

  set active(bool active) {
    // Toggle visibility of the sun

    actions.stopAll();

    double targetOpacity;
    if (!active)
      targetOpacity = 0.0;
    else
      targetOpacity = 1.0;

    actions.run(new ActionTween(
        (a) => _sun.opacity = a, _sun.opacity, targetOpacity, 2.0));

    if (active) {
      for (Ray ray in _rays) {
        actions.run(new ActionSequence(<Action>[
          new ActionDelay(1.5),
          new ActionTween(
              (a) => ray.opacity = a, ray.opacity, ray.maxOpacity, 1.5)
        ]));
      }
    } else {
      for (Ray ray in _rays) {
        actions.run(
            new ActionTween((a) => ray.opacity = a, ray.opacity, 0.0, 0.2));
      }
    }
  }
}
