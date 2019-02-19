import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';
import 'package:fitness/global.dart' as global;

class FireworksNode extends NodeWithSize {
  FireworksNode() : super(const Size(1024.0, 1024.0));
  double _countDown = 0.0;

  @override
  void update(double dt) {
    if (_countDown <= 0.0) {
      _addExplosion();
      _countDown = randomDouble();
    }

    _countDown -= dt;
  }

  Color _randomExplosionColor() {
    double rand = randomDouble();
    if (rand < 0.25)
      return Colors.pink[200];
    else if (rand < 0.5)
      return Colors.lightBlue[200];
    else if (rand < 0.75)
      return Colors.purple[200];
    else
      return Colors.cyan[200];
  }

  void _addExplosion() {
    Color startColor = _randomExplosionColor();
    Color endColor = startColor.withAlpha(0);

    ParticleSystem system = new ParticleSystem(global.sprites['particle-0.png'],
        numParticlesToEmit: 100,
        emissionRate: 1000.0,
        rotateToMovement: true,
        startRotation: 90.0,
        endRotation: 90.0,
        speed: 100.0,
        speedVar: 50.0,
        startSize: 1.0,
        startSizeVar: 0.5,
        gravity: const Offset(0.0, 30.0),
        colorSequence:
            new ColorSequence.fromStartAndEndColor(startColor, endColor));

    system.position =
        new Offset(randomDouble() * 1024.0, randomDouble() * 1024.0);
    addChild(system);
  }
}
