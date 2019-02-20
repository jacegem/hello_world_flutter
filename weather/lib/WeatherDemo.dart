import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:weather/global.dart' as global;

class WeatherDemo extends StatefulWidget {
  static const String routeName = '/weather';

  _WeatherDemoState createState() => _WeatherDemoState();
}

class _WeatherDemoState extends State<WeatherDemo> {
  // This method loads all assets that are needed for the demo.
  Future<Null> _loadAssets(AssetBundle bundle) async {
    // Load images using an ImageMap
    global.images = new ImageMap(bundle);
    await global.images.load(<String>[
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
    global.sprites =
        new SpriteSheet(global.images['assets/weathersprites.png'], json);
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
    return Container(
      child: child,
    );
  }
}
