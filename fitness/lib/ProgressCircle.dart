import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';
import 'dart:math' as math;

class ProgressCircle extends NodeWithSize {
  ProgressCircle(Size size, [this.value = 0.0]) : super(size);

  static const double _kTwoPI = math.pi * 2.0;
  static const double _kEpsilon = 0.0000001;
  static const double _kSweep = _kTwoPI - _kEpsilon;

  double value;

  @override
  void paint(Canvas canvas) {
    applyTransformForPivot(canvas);

    Paint circlePaint = new Paint()
      ..color = Colors.white30
      ..strokeWidth = 24.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(new Offset(size.width / 2.0, size.height / 2.0),
        size.width / 2.0, circlePaint);

    Paint pathPaint = new Paint()
      ..color = Colors.purple[500]
      ..strokeWidth = 25.0
      ..style = PaintingStyle.stroke;

    double angle = value.clamp(0.0, 1.0) * _kSweep;
    Path path = new Path()
      ..arcTo(Offset.zero & size, -math.pi / 2.0, angle, false);
    canvas.drawPath(path, pathPaint);
  }
}
