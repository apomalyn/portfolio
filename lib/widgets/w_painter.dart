import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:portfolio/utils/app_theme.dart';

class W extends StatelessWidget {
  final Color color;

  final double radians;

  /// Size of the W
  final double width;

  W({this.width, this.color = AppTheme.white, this.radians = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.width,
      child: CustomPaint(
        willChange: false,
        painter: WPainter(color: color, radians: radians),
      ),
    );
  }
}

class WPainter extends CustomPainter {
  final Color color;
  final double radians;

  final Paint _paint = Paint();

  WPainter({this.color = AppTheme.white, this.radians = 0});

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    _paint.style = PaintingStyle.fill;

    // 1 / 5 of the width and height
    double widthFive = size.width / 10;
    double heightFive = size.height / 10;

    Offset center = Offset(size.width / 2, size.height / 2);

    var path = Path();

    path.moveTo(center.dx, center.dy - 3 * heightFive);
    // Left side
    path.lineTo(center.dx - 2.5 * widthFive, center.dy - 0.5 * heightFive);
    path.lineTo(center.dx - 4 * widthFive, center.dy - 2.5 * heightFive);
    path.lineTo(center.dx - 4 * widthFive, center.dy + 0.5 * heightFive);
    path.lineTo(center.dx - 2.5 * widthFive, center.dy + 2.5 * heightFive);
    path.lineTo(center.dx, center.dy);
    // Right side
    path.lineTo(center.dx + 2.5 * widthFive, center.dy + 2.5 * heightFive);
    path.lineTo(center.dx + 4 * widthFive, center.dy + 0.5 * heightFive);
    path.lineTo(center.dx + 4 * widthFive, center.dy - 2.5 * heightFive);
    path.lineTo(center.dx + 2.5 * widthFive, center.dy - 0.5 * heightFive);

    path.close();

    // Rotate the canvas around the center.
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi * radians);
    canvas.translate(-center.dx, -center.dy);

    // Draw the W.
    canvas.drawShadow(path, Colors.black, 5, false);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(WPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(WPainter oldDelegate) => false;
}
