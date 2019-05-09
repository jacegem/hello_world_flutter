import 'dart:ui';

import 'package:boxgame/langaw_game.dart';
import 'package:boxgame/view.dart';
import 'package:flame/sprite.dart';

class HelpButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  HelpButton(this.game) {
    rect = Rect.fromLTWH(
        game.tileSize * .25,
        game.screenSize.height - (game.tileSize * 1.25),
        game.tileSize,
        game.tileSize);
    sprite = Sprite('ui/icon-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.help;
  }
}
