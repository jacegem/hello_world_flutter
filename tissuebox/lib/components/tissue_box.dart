import 'dart:math';

import 'package:flame/sprite.dart';
import 'package:flutter/painting.dart';
import 'package:tissuebox/components/tissue.dart';
import 'package:tissuebox/components/tissue_away.dart';
import 'package:tissuebox/game_table.dart';

class TissueBox {
  final GameTable game;

  Rect boxRect;
  int tissueCount;
  Tissue tissue;
  Sprite boxSprite;

  var tissueAwayList = List<TissueAway>(),
      rnd = Random(),
      ismoving = false,
      isAway = false;
  static var boxSize = Offset(150.0, 100.0);
  Offset get getTissueUpPosition =>
      Offset(initialRect.left, initialRect.top - 150);
  Rect get initialRect => Rect.fromLTWH(boxRect.center.dx - Tissue.width / 2,
      boxRect.top - boxRect.height + 20.3, Tissue.width, Tissue.width);
  double get initialLeft =>
      game.screenSize.width / 2 - TissueBox.boxSize.dx / 2;
  double get initialTop => game.screenSize.height - game.tileSize * 5.5;
  Sprite get getBoxSprite => Sprite(rnd.nextInt(7).toString());

  TissueBox(this.game) {
    boxRect = Rect.fromLTWH(initialLeft, initialTop, boxSize.dx, boxSize.dy);
    tissueCount = 10 - rnd.nextInt(5);
    tissue = Tissue(game, this);
    boxSprite = getBoxSprite;
  }

  render(Canvas c) {
    boxSprite.renderRect(c, boxRect);
    tissue.render(c);
    tissueAwayList.forEach((x) => x.render(c));
  }

  update(double t) {
    tissue.update(t);
    tissueAwayList.removeWhere((x) => x.isAway);
    tissueAwayList.forEach((x) => x.update(t));
    var distense = boxRect.left - initialLeft;
    if (ismoving && !game.gameover) {
      if (distense.abs() > 50 && tissueCount == 0) {
        isAway = true;
      }
    } else if (isAway && !game.gameover) {
      boxRect = boxRect.shift(Offset(
          distense > 0
              ? boxRect.left + game.k * 11
              : boxRect.left - game.k * 11,
          boxRect.top));
      if (boxRect.right < -50 || boxRect.left > game.screenSize.width + 50) {
        newBox();
      }
    } else if (isAway && game.gameover) {
      var target = Offset(boxRect.left, game.screenSize.height + Tissue.width) -
          Offset(boxRect.left, boxRect.top);
      boxRect = boxRect.shift(game.k * 11 < target.distance
          ? Offset.fromDirection(target.direction, game.k * 11)
          : target);
    } else {
      var target =
          Offset(initialLeft, initialTop) - Offset(boxRect.left, boxRect.top);
      boxRect = boxRect.shift(game.k * 11 < target.distance
          ? Offset.fromDirection(target.direction, game.k * 11)
          : target);
    }
  }

  newBox() {
    boxSprite = getBoxSprite;
    boxRect = Rect.fromLTWH(
        boxRect.right < -0 ? game.screenSize.width + 50 - boxSize.dx : -50.0,
        initialTop,
        boxSize.dx,
        boxSize.dy);
    tissueCount = 10 - rnd.nextInt(5);
    tissue = Tissue(game, this);
    isAway = false;
    ismoving = false;
  }

  newGame() async {
    isAway = true;
    GameTable.gameOver.resume();
    await delay(Duration(seconds: 2), () {});
    newBox();
  }

  nextTissue(int pointsAdd) {
    var duration = Duration(milliseconds: 100);
    tissueAwayList.add(TissueAway(game, this));
    if (pointsAdd > 1)
      delay(duration, () {
        tissueAwayList.add(TissueAway(game, this));
        if (pointsAdd > 2)
          delay(duration, () {
            tissueAwayList.add(TissueAway(game, this));
          });
      });
    tissue = Tissue(game, this, --tissueCount == 0);
  }

  static delay(duration, func()) async => await Future.delayed(duration, func);
}
