import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:portfolio/utils/app_theme.dart';

class Dot extends StatelessWidget {
  final Color color;

  final double radius;

  /// Draw a dashed arc, the offset is the center of the arc inside de canvas.
  const Dot(this.radius, {this.color = AppTheme.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.radius * 2,
      height: this.radius * 2,
      child: CustomPaint(
        willChange: false,
        painter: _DotPainter(radius, color: color),
      ),
    );
  }
}

class _DotPainter extends CustomPainter {
  final Color color;

  final double radius;

  final Paint _paint = Paint()..style = PaintingStyle.fill;

  _DotPainter(this.radius, {this.color = AppTheme.white});

  @override
  void paint(Canvas canvas, Size size) {
    // Initialize
    _paint.color = this.color;
    Offset center = Offset(size.width / 2, size.width / 2);

    // Draw
    canvas.drawCircle(center, radius, _paint);
  }

  @override
  bool shouldRepaint(_DotPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_DotPainter oldDelegate) => false;
}
