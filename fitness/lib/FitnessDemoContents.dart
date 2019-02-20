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
            new Flexible(
              child: new Container(
                  decoration: new BoxDecoration(color: Colors.grey[800]),
                  child: new SpriteWidget(
                      workoutAnimation, SpriteBoxTransformMode.scaleToFit)),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
              child: new Text(
                'JUMPING JACKS',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            new Padding(
                padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _createInfoPanelCell(
                          Icons.accessibility, '$_count', 'COUNT'),
                      _createInfoPanelCell(
                          Icons.timer, _formatSeconds(_time), 'TIME'),
                      _createInfoPanelCell(Icons.flash_on, '$kcal', 'KCAL')
                    ])),
            new Padding(
                padding: new EdgeInsets.only(bottom: 16.0),
                child: new SizedBox(
                    width: 300.0,
                    height: 72.0,
                    child: new RaisedButton(
                        onPressed: onButtonPressed,
                        color: buttonColor,
                        child: new Text(buttonText,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20.0)))))
          ]),
    );
  }

  Widget _createInfoPanelCell(IconData icon, String value, String description) {
    Color color;
    if (workoutAnimation.workingOut)
      color = Colors.black87;
    else
      color = Theme.of(context).disabledColor;

    return new Container(
        width: 100.0,
        child: new Center(
            child: new Column(children: <Widget>[
          new Icon(icon, size: 48.0, color: color),
          new Text(value, style: new TextStyle(fontSize: 24.0, color: color)),
          new Text(description, style: new TextStyle(color: color))
        ])));
  }

  String _formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    String secondsStr = "${seconds % 60}".padLeft(2, '0');
    return '$minutes:$secondsStr';
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
