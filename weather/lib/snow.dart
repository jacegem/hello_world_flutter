import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/global.dart' as g;
// Snow. Uses 9 particles systems to create a parallax effect of nsow at
// differenct distances.

class Snow extends Node {
  Snow() {
    // 9 particles
    _addParticles(g.sprites['flake-0.png'], 1.0);
    _addParticles(g.sprites['flake-1.png'], 1.0);
    _addParticles(g.sprites['flake-2.png'], 1.0);

    _addParticles(g.sprites['flake-3.png'], 1.5);
    _addParticles(g.sprites['flake-4.png'], 1.5);
    _addParticles(g.sprites['flake-5.png'], 1.5);

    _addParticles(g.sprites['flake-6.png'], 2.0);
    _addParticles(g.sprites['flake-7.png'], 2.0);
    _addParticles(g.sprites['flake-8.png'], 2.0);
  }

  List<ParticleSystem> _particles = <ParticleSystem>[];

  void _addParticles(SpriteTexture texture, double distance) {
    ParticleSystem particles = new ParticleSystem(texture,
        transferMode: BlendMode.srcATop,
        posVar: const Offset(1300.0, 0.0),
        direction: 90.0,
        directionVar: 0.0,
        speed: 150.0 / distance,
        speedVar: 50.0 / distance,
        startSize: 1.0 / distance,
        startSizeVar: 0.3 / distance,
        endSize: 1.2 / distance,
        endSizeVar: 0.2 / distance,
        life: 20.0 * distance,
        lifeVar: 10.0 * distance,
        emissionRate: 2.0,
        startRotationVar: 360.0,
        endRotationVar: 360.0,
        radialAccelerationVar: 10.0 / distance,
        tangentialAccelerationVar: 10.0 / distance);

    particles.position = const Offset(1024.0, -50.0);
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
