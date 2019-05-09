import 'dart:ui';

import 'package:boxgame/langaw_game.dart';
import 'package:boxgame/view.dart';
import 'package:flame/sprite.dart';

class StartButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}
  void onTapDown() {
    game.playPlayingBGM();


    game.score = 0;

    game.activeView = View.playing;
    game.spawner.start();
  }
}
