import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/CloudLayer.dart';
import 'package:weather/GradientNode.dart';
import 'package:weather/global.dart';
import 'package:weather/rain.dart';
import 'package:weather/snow.dart';
import 'package:weather/sun.dart';

// For the different weathers we are displaying different gradient backgrounds,
// these are the colors for top and bottom.
const List<Color> _kBackgroundColorsTop = const <Color>[
  const Color(0xff5ebbd5),
  const Color(0xff0b2734),
  const Color(0xffcbced7)
];

const List<Color> _kBackgroundColorsBottom = const <Color>[
  const Color(0xff4aaafb),
  const Color(0xff4c5471),
  const Color(0xffe0e3ec)
];

// The WeatherWorld is our root m=node for our sprite tree. The size of the tree
// will be scaled to fit into our SpriteWidget container
class WeatherWorld extends NodeWithSize {
  WeatherWorld() : super(const Size(2048.0, 2048.0)) {
    // Start by adding a background.
    _background = new GradientNode(
      this.size,
      _kBackgroundColorsTop[0],
      _kBackgroundColorsBottom[0],
    );
    addChild(_background);

    // Then three layers of clouds, that will be scrolled in parallax.
    _cloudsSharp = new CloudLayer(
        image: images['assets/clouds-0.png'],
        rotated: false,
        dark: false,
        loopTime: 20.0);
    addChild(_cloudsSharp);

    _cloudsDark = new CloudLayer(
      image: images['assets/clouds-1.png'],
      rotated: true,
      dark: true,
      loopTime: 40.0,
    );
    addChild(_cloudsDark);

    _cloudsSoft = new CloudLayer(
        image: images['assets/clouds-1.png'],
        rotated: false,
        dark: false,
        loopTime: 60.0);
    addChild(_cloudsSoft);

    // Add teh sun, rain, and snow (which we are going to fade in/out depending)
    // on which weather are selected.
    _sun = new Sun();
    _sun.position = const Offset(1024.0, 1024.0);
    _sun.scale = 1.5;
    addChild(_sun);

    _rain = new Rain();
    addChild(_rain);

    _snow = new Snow();
    addChild(_snow);
  }

  GradientNode _background;
  CloudLayer _cloudsSharp;
  CloudLayer _cloudsSoft;
  CloudLayer _cloudsDark;
  Sun _sun;
  Rain _rain;
  Snow _snow;

  WeatherType get weatherType => _weatherType;
  WeatherType _weatherType = WeatherType.sun;

  set weatherType(WeatherType weatherType) {
    if (weatherType == _weatherType) return;

    // Handle changes between weather types.
    _weatherType = weatherType;

    // Fade the background
    _background.actions.stopAll();

    // Fade the background from one gradient to another.
    _background.actions.run(new ActionTween((a) => _background.colorTop = a,
        _background.colorTop, _kBackgroundColorsTop[weatherType.index], 1.0));

    _background.actions.run(new ActionTween(
        (a) => _background.colorBottom,
        _background.colorBottom,
        _kBackgroundColorsBottom[weatherType.index],
        1.0));

    // Activate/deactivate sun, rain, snow, and dark clouds.
    _cloudsDark.active = weatherType != WeatherType.sun;
    _sun.active = weatherType == WeatherType.sun;
    _rain.active = weatherType == WeatherType.rain;
    _snow.active = weatherType == WeatherType.snow;
  }

  @override
  void spriteBoxPerformedLayout() {
    // If the device is rotated or if the size of the SpriteWidget changes we are adjusting the position of the sun
    _sun.position = spriteBox.visibleArea.topLeft + const Offset(350.0, 180.0);
  }
}
