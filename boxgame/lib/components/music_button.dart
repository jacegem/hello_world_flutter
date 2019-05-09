import 'dart:ui';
import 'package:boxgame/langaw_game.dart';
import 'package:flame/sprite.dart';

class MusicButton {
  final LangawGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  MusicButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.tileSize * .25,
      game.tileSize,
      game.tileSize,
    );
    enabledSprite = Sprite('ui/icon-music-enabled.png');
    disabledSprite = Sprite('ui/icon-music-disabled.png');
  }

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, rect);
    } else {
      disabledSprite.renderRect(c, rect);
    }
  }

  void onTapDown() async {
    if (isEnabled) {
      isEnabled = false;

      var home = await game.homeBGM.setVolume(0);
      print('home: $home');
      var bgm = await game.playingBGM.setVolume(0);
      print('bgm: $bgm');
    } else {
      isEnabled = true;
      var home = await game.homeBGM.setVolume(.25);
      print('home: $home');
      var bgm = game.playingBGM.setVolume(.25);
      print('bgm: $bgm');
    }
  }
}
