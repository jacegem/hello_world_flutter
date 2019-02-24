import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/global.dart' as g;

class Rain extends Node {
  Rain() {
    _addParticles(1.0);
    _addParticles(1.5);
    _addParticles(2.0);
  }

  List<ParticleSystem> _particles = <ParticleSystem>[];

  void _addParticles(double distance) {
    ParticleSystem particles = new ParticleSystem(g.sprites['raindrop.png'],
        transferMode: BlendMode.srcATop,
        posVar: const Offset(1300.0, 0.0),
        direction: 90.0,
        directionVar: 0.0,
        speed: 1000.0 / distance,
        speedVar: 100.0 / distance,
        startSize: 1.2 / distance,
        startSizeVar: 0.2 / distance,
        endSize: 1.2 / distance,
        endSizeVar: 0.2 / distance,
        life: 1.5 * distance,
        lifeVar: 1.0 * distance);

    particles.position = const Offset(1024.0, -200.0);
    particles.rotation = 10.0;
    particles.opacity = 0.0;

    _particles.add(particles);
    addChild(particles);
  }

  set active(bool active) {
    actions.stopAll();
    for (ParticleSystem system in _particles) {
      if (active) {
        actions.run(new ActionTween(
            (a) => system.opacity = a, system.opacity, 1.0, 2.0));
      } else {
        actions.run(new ActionTween(
            (a) => system.opacity = a, system.opacity, 0.0, 0.5));
      }
    }
  }
}
