import 'dart:ui';

import 'package:boxgame/langaw_game.dart';
import 'package:flame/sprite.dart';

class LostView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  LostView(this.game) {
    rect = Rect.fromLTWH(
        game.tileSize,
        (game.screenSize.height / 2) - (game.tileSize * 5),
        game.tileSize * 7,
        game.tileSize * 5);
    sprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
