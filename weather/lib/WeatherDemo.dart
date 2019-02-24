import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:weather/WeatherButton.dart';
import 'package:weather/WeatherWorld.dart';
import 'package:weather/global.dart' as g;
import 'package:weather/global.dart';

class WeatherDemo extends StatefulWidget {
  static const String routeName = '/weather';

  _WeatherDemoState createState() => _WeatherDemoState();
}

class _WeatherDemoState extends State<WeatherDemo> {
  // This method loads all assets that are needed for the demo.
  Future<Null> _loadAssets(AssetBundle bundle) async {
    // Load images using an ImageMap
    g.images = new ImageMap(bundle);
    await g.images.load(<String>[
      'assets/clouds-0.png',
      'assets/clouds-1.png',
      'assets/ray.png',
      'assets/sun.png',
      'assets/weathersprites.png',
      'assets/icon-sun.png',
      'assets/icon-rain.png',
      'assets/icon-snow.png'
    ]);

    // Load the sprite sheet, which contains snowflakes and rain drops.
    String json = await DefaultAssetBundle.of(context)
        .loadString('assets/weathersprites.json');
    g.sprites = new SpriteSheet(g.images['assets/weathersprites.png'], json);
  }

  void initState() {
    // Always call super.initState
    super.initState();

    // Get our root asset bundle
    AssetBundle bundle = rootBundle;

    // Laod all graphics, then set the state to assetsLoaded and create the
    // WeatherWorld sprite tree
    _loadAssets(bundle).then((_) {
      setState(() {
        assetsLoaded = true;
        weatherWorld = new WeatherWorld();
      });
    });
  }

  bool assetsLoaded = false;
  // The weather world is our sprite tree that handles the weather
  // animations
  WeatherWorld weatherWorld;

  @override
  Widget build(BuildContext context) {
    // Until assets are loaded we are just displaying a blue screen.
    // If we were to load many more images, we might want to do some
    // loading animation here.
    if (!assetsLoaded) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Weather'),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            color: const Color(0xff4aaafb),
          ),
        ),
      );
    }

    // All assets are loaded, build the whole app with weather buttons
    // and the WeatherWorld.
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Weather'),
        ),
        body: new Material(
            child: new Stack(
          children: <Widget>[
            new SpriteWidget(weatherWorld),
            new Align(
                alignment: new FractionalOffset(0.5, 0.8),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new WeatherButton(
                      onPressed: () {
                        setState(() {
                          weatherWorld.weatherType = g.WeatherType.sun;
                        });
                      },
                      selected: weatherWorld.weatherType == WeatherType.sun,
                      icon: 'assets/icon-sun.png',
                    ),
                    new WeatherButton(
                      onPressed: () {
                        setState(() {
                          weatherWorld.weatherType = WeatherType.rain;
                        });
                      },
                      selected: weatherWorld.weatherType == WeatherType.rain,
                      icon: 'assets/icon-rain.png',
                    ),
                    new WeatherButton(
                      onPressed: () {
                        setState(() {
                          weatherWorld.weatherType = WeatherType.snow;
                        });
                      },
                      selected: weatherWorld.weatherType == WeatherType.snow,
                      icon: 'assets/icon-snow.png',
                    )
                  ],
                ))
          ],
        )));
  }
}
