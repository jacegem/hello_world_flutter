import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tissuebox/game_table.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  await Flame.images.loadAll(
      ['background.png', '0', '1', '2', '3', '4', '5', '6', 't', 'crown.png']);

  audioLoad(c) async => (await Flame.audio.load(c));

  setAudio(a, s, v) async {
    await a.setUrl(await audioLoad(s), isLocal: true);
    a.setVolume(v);
  }

  setAudioList(list, file) async {
    double volume = 1.0;
    list.forEach((audio) async {
      await setAudio(audio, file, volume);
    });
  }

  // Flame.audio.loadAll(<String>['s.mp3', 'd.mp3', 't.mp3']);
  // GameTable.setAudioList(GameTable.audioList1, 's.mp3');
  // GameTable.setAudioList(GameTable.audioList2, 'd.mp3');
  // GameTable.setAudioList(GameTable.audioList3, 't.mp3');
  await setAudioList(GameTable.audioList1, 's.mp3');
  await setAudioList(GameTable.audioList1, 'd.mp3');
  await setAudioList(GameTable.audioList1, 't.mp3');
  await setAudio(GameTable.tickTock, 'tk.mp3', 1.0);
  await setAudio(GameTable.gameOver, 'a.mp3', .5);

  SharedPreferences storage = await SharedPreferences.getInstance();
  GameTable game = GameTable(storage);

  var hDrag = HorizontalDragGestureRecognizer();
  hDrag.onUpdate = game.onDragUpdate;
  hDrag.onStart = game.onDragStart;
  hDrag.onEnd = game.onDragEnd;

  var vDrag = VerticalDragGestureRecognizer();
  vDrag.onUpdate = game.onDragUpdate;
  vDrag.onStart = game.onDragStart;
  vDrag.onEnd = game.onDragEnd;

  runApp(game.widget);
  flameUtil.addGestureRecognizer(hDrag);
  flameUtil.addGestureRecognizer(vDrag);
}
