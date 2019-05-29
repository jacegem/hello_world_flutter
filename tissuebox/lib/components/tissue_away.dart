import 'dart:ui';

import 'package:tissuebox/components/tissue.dart';
import 'package:tissuebox/components/tissue_box.dart';
import 'package:tissuebox/game_table.dart';

class TissueAway extends Tissue {
  TissueAway(GameTable game, TissueBox tissueBox) : super(game, tissueBox);
  render(Canvas c) => tissueSprite.renderRect(c, rect);
  update(double t) {
    var speed = 500 * t;
    Offset target = tissueBox.getTissueUpPosition - Offset(rect.left, rect.top);
    if (speed < target.distance)
      rect = rect.shift(Offset.fromDirection(target.direction, speed));
    else
      isAway = true;
  }
}
