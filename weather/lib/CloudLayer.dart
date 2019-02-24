import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'dart:ui' as ui show Image;

class CloudLayer extends Node {
  CloudLayer({ui.Image image, bool dark, bool rotated, double loopTime}) {
    // Creates and positions the two cloud sprites.
    _sprites.add(_createSprite(image, dark, rotated));
    _sprites[0].position = const Offset(1024.0, 1024.0);
    addChild(_sprites[0]);

    _sprites.add(_createSprite(image, dark, rotated));
    _sprites[1].position = const Offset(3072.0, 1024.0);
    addChild(_sprites[1]);

    // Animates the clouds across the screen.
    actions.run(new ActionRepeatForever(new ActionTween<Offset>(
        (a) => position = a,
        Offset.zero,
        const Offset(-2048.0, 0.0),
        loopTime)));
  }

  List<Sprite> _sprites = <Sprite>[];

  Sprite _createSprite(ui.Image image, bool dark, bool rotated) {
    Sprite sprite = new Sprite.fromImage(image);

    if (rotated) sprite.scaleX = -1.0;

    if (dark) {
      sprite.colorOverlay = const Color(0xff000000);
      sprite.opacity = 0.0;
    }

    return sprite;
  }

  set active(bool active) {
    // Toggle visibility of the cloud layer
    double opacity;
    if (active)
      opacity = 1.0;
    else
      opacity = 0.0;

    for (Sprite sprite in _sprites) {
      sprite.actions.stopAll();
      sprite.actions.run(new ActionTween<double>(
          (a) => sprite.opacity = a, sprite.opacity, opacity, 1.0));
    }
  }
}
