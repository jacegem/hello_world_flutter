import 'package:fitness/Fireworks.dart';
import 'package:fitness/WorkoutAnimationNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:fitness/global.dart' as global;

class FitnessDemoContents extends StatefulWidget {
  FitnessDemoContents({Key key}) : super(key: key);

  @override
  _FitnessDemoContentsState createState() => _FitnessDemoContentsState();
}

class _FitnessDemoContentsState extends State<FitnessDemoContents> {
  Future<Null> _loadAssets(AssetBundle bundle) async {
    global.images = new ImageMap(rootBundle);
    await global.images.load(<String>['assets/jumpingjack.png']);

    String json = await DefaultAssetBundle.of(context)
        .loadString('assets/jumpingjack.json');
    global.sprites =
        new SpriteSheet(global.images['assets/jumpingjack.png'], json);
  }

  @override
  void initState() {
    super.initState();

    _loadAssets(rootBundle).then((_) {
      setState(() {
        _assetsLoaded = true;
        workoutAnimation = new WorkoutAnimationNode(onPerformedJumpingJack: () {
          setState(() {
            _count += 1;
          });
        }, onSecondPassed: (int seconds) {
          setState(() {
            _time = seconds;
          });
        });
      });
    });
  }

  bool _assetsLoaded = false;
  int _count = 0;
  int _time = 0;
  int get kcal => (_count * 0.2).toInt();
  WorkoutAnimationNode workoutAnimation;

  @override
  Widget build(BuildContext context) {
    if (!_assetsLoaded) return new Container();

    Color buttonColor;
    String buttonText;
    VoidCallback onButtonPressed;

    if (workoutAnimation.workingOut) {
      buttonColor = Colors.red[500];
      buttonText = "STOP WORKOUT";
      onButtonPressed = endWorkout;
    } else {
      buttonColor = Theme.of(context).primaryColor;
      buttonText = 'START WORKOUT';
      onButtonPressed = startWorkout;
    }

    return new Material(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
              child: new Text(
                'JUMPING JACKS',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ]),
    );
  }

  void startWorkout() {
    setState(() {
      _count = 0;
      _time = 0;
      workoutAnimation.start();
    });
  }

  void endWorkout() {
    setState(() {
      workoutAnimation.stop();
      if (_count >= 3) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return new Stack(children: <Widget>[
                new Fireworks(),
                new AlertDialog(
                  title: new Text('Awesome workout'),
                  content: new Text(
                      'You have completed $_count jumping jacks. Good going!'),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text('SWEET'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ]);
            });
      }
    });
  }
}
