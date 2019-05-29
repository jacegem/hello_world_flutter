import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tissuebox/components/tissue_box.dart';
import 'package:tissuebox/state.dart' as s;

class GameTable extends Game {
  final SharedPreferences storage;

  var background = Sprite('background.png'),
      crown = Sprite('crown.png'),
      initialPoint = Offset.zero,
      destPoint = Offset.zero,
      dragState = s.Drag.none,
      gameing = false,
      gameover = false,
      timePass = .0,
      highScore = 0,
      score = 0,
      timePassTemp = 0;

  double tileSize, point1;
  double get k => screenSize.width / 5 / tileSize;
  Size screenSize;
  Rect rect;
  TissueBox tissueBox;

  GameTable(this.storage) {
    init();
  }

  init() async {
    resize(await Flame.util.initialDimensions());
    rect = Rect.fromLTWH(
        .0, screenSize.height - tileSize * 23, tileSize * 9, tileSize * 23);
    tissueBox = TissueBox(this);
  }

  resize(s) {
    screenSize = s;
    tileSize = screenSize.width / 9;
  }

  static var tickTock = AudioPlayer(),
      gameOver = AudioPlayer(),
      audioList1 = [AudioPlayer(), AudioPlayer(), AudioPlayer()],
      audioList2 = [AudioPlayer(), AudioPlayer()],
      audioList3 = [AudioPlayer(), AudioPlayer()],
      audioIndex1 = 0,
      audioIndex2 = 0,
      audioIndex3 = 0;

  static getPlayIndex(int audioPlayer) {
    if (audioPlayer == 1) {
      audioIndex1 = audioIndex1 < audioList1.length - 1 ? audioIndex1 + 1 : 0;
    } else if (audioPlayer == 2) {
      audioIndex2 = audioIndex2 < audioList2.length - 1 ? audioIndex2 + 1 : 0;
    } else if (audioPlayer == 3) {
      audioIndex3 = audioIndex3 < audioList3.length - 1 ? audioIndex3 + 1 : 0;
    }

    return audioPlayer == 1
        ? audioIndex1
        : audioPlayer == 2 ? audioIndex2 : audioIndex3;
  }

  static audioLoad(c) async => (await Flame.audio.load(c));

  static get tissue1 => audioList1[getPlayIndex(1)];
  static get tissue2 => audioList2[getPlayIndex(2)];
  static get tissue3 => audioList3[getPlayIndex(3)];

  static setAudioList(List<AudioPlayer> al, String f) async {
    await Flame.audio.load(f);

    al.forEach((x) {
      x.setUrl(f, isLocal: true);
      x.setVolume(.2);
    });
  }

  saveHighScore() async {
    storage.setInt('hs', highScore);
  }

  onDragStart(DragStartDetails detail) {
    var point = detail.globalPosition;
    dragState = tissueBox.tissue.rect.contains(point)
        ? s.Drag.tissue
        : tissueBox.boxRect.contains(point) ? s.Drag.box : s.Drag.none;
    initialPoint = Offset(point.dx == 0 ? initialPoint.dx : point.dx,
        point.dy == 0 ? initialPoint.dy : point.dy);
    point1 = (tissueBox.tissue.rect.left - point.dx).abs();
  }

  onDragUpdate(DragUpdateDetails detail) {
    if (gameover || dragState == s.Drag.none) return;
    var point = detail.globalPosition;
    destPoint = Offset(point.dx == 0 ? destPoint.dx : point.dx,
        point.dy == 0 ? destPoint.dy : point.dy);
    if (dragState == s.Drag.tissue) {
      if (initialPoint.dy - destPoint.dy > 100) {
        if (gameing != true && gameover != true) {
          gameing = true;
          timePass = 10;
          score = 0;
        }
        var sub =
            (point1 - (tissueBox.tissue.rect.left - point.dx).abs()).abs();
        var addPoint = sub < 3 ? 3 : sub < 6 ? 2 : 1;
        dragState = s.Drag.none;
        tissueBox.nextTissue(addPoint);
        playTissueAudio(addPoint);
        score += addPoint;
      }
    } else if (dragState == s.Drag.box) {
      tissueBox.boxRect = Rect.fromLTWH(
          tissueBox.initialLeft + destPoint.dx - initialPoint.dx,
          tissueBox.boxRect.top,
          TissueBox.boxSize.dx,
          TissueBox.boxSize.dy);
      tissueBox.ismoving = true;
    }
  }

  playTissueAudio(i) {
    (i == 1
            ? GameTable.tissue1
            : i == 2 ? GameTable.tissue2 : GameTable.tissue3)
        .resume();
  }

  onDragEnd(DragEndDetails detail) {
    initialPoint = Offset.zero;
    dragState = s.Drag.none;
    tissueBox.tissue.isMoving = false;
    tissueBox.ismoving = false;
    destPoint = initialPoint;
  }

  @override
  void render(Canvas c) {
    paintText(txt, offset, center, fontSize) {
      var painter = TextPainter(
          text: TextSpan(
              style: TextStyle(
                  color: Colors.white, fontSize: fontSize, fontFamily: 'NS'),
              text: txt),
          textScaleFactor: k,
          textDirection: TextDirection.ltr);
      painter.layout();
      painter.paint(c,
          center ? Offset(offset.dx - painter.width / 2, offset.dy) : offset);
    }

    background.renderRect(c, rect);
    tissueBox.render(c);
    var horCenter = tissueBox.initialLeft + tissueBox.boxRect.width / 2;

    if (gameing) {
      paintText(timePass.toStringAsFixed(timePass < 1 ? 1 : 0) + 's',
          Offset(horCenter + 8, k * 23), true, k * 10);
    }

    var highScoreTxt = highScore.toString();
    paintText(
        highScoreTxt,
        Offset(
            highScoreTxt.length == 1
                ? 44.0
                : highScoreTxt.length > 2 ? 22.0 : 33.0,
            k * 30),
        false,
        k * 12);
    crown.renderRect(c, Rect.fromLTWH(28.0, k * 10, 49.2, 39.0));
    paintText(score.toString(), Offset(horCenter, k * 50), true, k * 25);
    highScore = score > highScore ? score : highScore;
  }

  @override
  update(double t) {
    tissueBox.update(t);
    timePass -= gameing || gameover ? t : 0;
    if (timePass < 0 && gameing) {
      tissueBox.isAway = true;
      gameing = false;
      timePass = 2;
      gameover = true;
      saveHighScore();
      tissueBox.newGame();
    } else if (gameing && !gameover) {
      var floor = timePass.floor();
      if (floor < timePassTemp && floor < 6 && floor != 0)
        TissueBox.delay(
            Duration(milliseconds: 300), () => GameTable.tickTock.resume());
      timePassTemp = floor;
    }
    gameover = timePass <= 0 && gameover ? false : gameover;
  }
}
