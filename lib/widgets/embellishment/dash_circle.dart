import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:portfolio/utils/app_theme.dart';

class DashedArc extends StatelessWidget {
  final Color color;

  final double radius;

  /// Starting angle of the arc.
  /// Should be between 0 and 360°
  final double startAngle;

  /// Size of the arc.
  /// Should be between 0 and 360°
  final double sweepAngle;

  /// Angle occupied by every dash.
  /// Should be between 0 and 360°
  final double sizeDash;

  /// Angle occupied between every dash.
  /// Should be between 0 and 360°
  final double angleBetweenDash;

  /// Width of each strokes
  final double strokeWidth;

  /// Center of the arc.
  final Offset arcCenter;

  /// Draw a dashed arc, the offset is the center of the arc inside de canvas.
  const DashedArc(this.radius,
      {this.startAngle = 0.0,
      this.sweepAngle = 90,
      this.sizeDash = 10,
      this.angleBetweenDash = 5,
      this.strokeWidth,
      this.arcCenter,
      this.color = AppTheme.white})
      : assert(startAngle < 360 && startAngle >= 0),
        assert(sweepAngle < 360 && sweepAngle >= 0),
        assert(sizeDash <= 360 && sizeDash > 0),
        assert(angleBetweenDash <= 360 && angleBetweenDash > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.radius * 2,
      height: this.radius * 2,
      child: CustomPaint(
        willChange: false,
        size: Size.infinite,
        painter: _DashedArcPainter(
            startAngle: startAngle,
            sweepAngle: sweepAngle,
            sizeDash: sizeDash,
            angleBetweenDash: angleBetweenDash,
            strokeWidth: strokeWidth,
            arcCenter: arcCenter,
            color: color,
            radius: radius),
      ),
    );
  }
}

class _DashedArcPainter extends CustomPainter {
  final Color color;
  final double radius;

  /// Starting angle of the arc in rad
  final double startAngle;

  /// End angle of the arc in rad
  final double sweepAngle;

  /// Angle occupied by every dash in rad
  final double sizeDash;

  /// Angle occupied between every dash in rad
  final double angleBetweenDash;

  /// Width of each strokes
  final double strokeWidth;

  /// Center of the arc.
  final Offset arcCenter;

  final Paint _paint = Paint()..style = PaintingStyle.stroke;

  static double degToRad(double degree) => degree * (math.pi / 180);

  _DashedArcPainter(
      {@required this.radius,
      double startAngle = 0.0,
      double sweepAngle = 90.0,
      double sizeDash = 10.0,
      double angleBetweenDash = 5.0,
      this.strokeWidth,
      this.arcCenter = const Offset(0, 0),
      this.color = AppTheme.white})
      : this.startAngle = degToRad(startAngle),
        this.sweepAngle = degToRad(sweepAngle),
        this.sizeDash = degToRad(sizeDash),
        this.angleBetweenDash = degToRad(angleBetweenDash);

  @override
  void paint(Canvas canvas, Size size) {
    // Initialize
    _paint.color = this.color;
    if (this.strokeWidth != null) _paint.strokeWidth = this.strokeWidth;

    var rect = Rect.fromCenter(
        center: arcCenter, width: this.radius * 2, height: this.radius * 2);

    var currentStartAngle = this.startAngle;

    // Draw
    while (currentStartAngle - this.startAngle < this.sweepAngle) {
      // Draw the dash
      canvas.drawArc(rect, currentStartAngle, sizeDash, false, _paint);

      // Update position of next dash
      currentStartAngle += sizeDash + angleBetweenDash;
    }
  }

  @override
  bool shouldRepaint(_DashedArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_DashedArcPainter oldDelegate) => false;
}
