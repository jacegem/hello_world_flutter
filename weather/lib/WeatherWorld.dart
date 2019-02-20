import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/GradientNode.dart';
import 'package:weather/global.dart' as g;

CloudLayer

class WeatherWorld extends NodeWithSize {
  WeatherWorld() : super(const Size(2048.0, 2048.0)) {
    // Start by adding a background.
    g.background = new GradientNode(
      this.size,
      g.kBackgroundColorsTop[0],
      g.kBackgroundColorsBottom[0],
    );
    addChild(g.background);

    // Then three layers of clouds, that will be scrolled in parallax.

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
