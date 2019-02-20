import 'package:spritewidget/spritewidget.dart';
import 'dart:ui' as ui show Image;

List<Sprite> _sprites = <Sprite>[];

class CloudLayer extends Node {
  CloudLayer({ui.Image image, bool dark, bool rotated, double loopTime}) {
    // Creates and positions the two cloud sprites.
    _sprites.add(_createSprite(image, dark, rotated));
  }
}
