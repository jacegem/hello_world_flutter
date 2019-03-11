import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:countdown_timer/timer_painter.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}:${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Map<int, dynamic> _alarmMap = Map();
  AudioCache audioCache = new AudioCache();

  @override
  void initState() {
    super.initState();
    audioCache.load('sound/beep-long.mp3');
    audioCache.load('sound/beep-short.mp3');

    int threeSec = 3;
    int twoSec = 2;
    int oneSec = 1;

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )
      ..addListener(() {
        // chekc 1 sec before
        Duration duration = controller.duration * controller.value;

        // print(duration.inSeconds % 60);

        if (_alarmMap.containsKey(threeSec) == false) {
          if (duration.inSeconds % 60 < threeSec) {
            playSoundShort();
            print('from threeSec ${duration.inSeconds % 60}');
            _alarmMap[threeSec] = true;
          }
        } else if (_alarmMap.containsKey(twoSec) == false) {
          if (duration.inSeconds % 60 < twoSec) {
            playSoundShort();
            print('from twoSec ${duration.inSeconds % 60}');
            _alarmMap[twoSec] = true;
          }
        } else if (_alarmMap.containsKey(oneSec) == false) {
          if (duration.inSeconds % 60 < oneSec) {
            playSoundShort();
            print('from oneSec ${duration.inSeconds % 60}');
            _alarmMap[oneSec] = true;
          }
        }

        // check 2 sec before
        // print(controller.value);
        // print(timerString);
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print('## AnimationStatus.completed');
        } else if (status == AnimationStatus.dismissed) {
          print('## AnimationStatus.dismissed');
          playSoundLong();
          _alarmMap = Map();
        } else if (status == AnimationStatus.forward) {
          print('## AnimationStatus.forward');
        } else if (status == AnimationStatus.reverse) {
          print('## AnimationStatus.reverse');
        }
      });
    ;
  }

  void playSoundLong() {
    audioCache.play('sound/beep-long.mp3', mode: PlayerMode.LOW_LATENCY);
  }

  void playSoundShort() {
    // AudioCache audioCache = new AudioCache();
    audioCache.play('sound/beep-short.mp3', mode: PlayerMode.LOW_LATENCY);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: themeData.indicatorColor,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Count Down",
                              style: themeData.textTheme.subhead,
                            ),
                            // Text(
                            //   controller.isAnimating
                            //       ? controller.value.toStringAsFixed(3)
                            //       : "Stopped!",
                            // ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: themeData.textTheme.display3,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return new Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);
                      },
                    ),
                    onPressed: () {
                      // audioCache.play('sound/beep-short.mp3',
                      //     mode: PlayerMode.LOW_LATENCY);

                      // playSoundShort();

                      if (controller.isAnimating) {
                        controller.stop();
                        setState(() {});
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                      }
                      // setState(() {});
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
