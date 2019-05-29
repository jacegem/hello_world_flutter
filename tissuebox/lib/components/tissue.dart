import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:tissuebox/components/tissue_box.dart';
import 'package:tissuebox/game_table.dart';

class Tissue {
  var tissueSprite = Sprite('t'), isMoving = false;
  static var width = 100.0;
  final TissueBox tissueBox;
  final GameTable game;
  bool isAway;
  Rect rect;
  Tissue(this.game, this.tissueBox, [this.isAway = false]) {
    rect = tissueBox.initialRect;
  }
  render(Canvas c) => tissueSprite.renderRect(c, rect);
  update(double t) =>
      rect = isAway ? rect.shift(Offset.infinite) : tissueBox.initialRect;
}
