import 'dart:core';

import 'package:spritewidget/spritewidget.dart';
import 'package:weather/GradientNode.dart';
import 'package:flutter/material.dart';

ImageMap images;
SpriteSheet sprites;
GradientNode background;

// For the different weathers we are displaying different gradient backgrounds,
// these are the colors for top and bottom.
const List<Color> kBackgroundColorsTop = const <Color>[
  const Color(0xff5ebbd5),
  const Color(0xff0b2734),
  const Color(0xffcbced7)
];

const List<Color> kBackgroundColorsBottom = const <Color>[
  const Color(0xff4aaafb),
  const Color(0xff4c5471),
  const Color(0xffe0e3ec)
];

enum WeatherType { sun, rain, snow }
