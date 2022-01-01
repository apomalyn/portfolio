import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:portfolio/utils/app_theme.dart';

class TailSectionShape extends StatelessWidget {
  /// Color of the shape
  final Color color;

  /// Child of the section.
  final Widget? child;

  const TailSectionShape({this.color = AppTheme.lightBlack, this.child});

  @override
  Widget build(BuildContext context) => CustomPaint(
    willChange: false,
    painter: _TailShapePainter(
      color: this.color
    ),
    child: this.child,
  );
}

/// This painter will create a shape similar to tail of the fox logo.
class _TailShapePainter extends CustomPainter {

  final Color? color;

  final Paint _paint = Paint()..style = PaintingStyle.fill;

  _TailShapePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = this.color!;

    Offset tailBottomLeft = Offset(size.width * 0.35, size.height * 0.45);
    Offset tailCenter = Offset(size.width * 0.5, size.height * 0.15);
    Offset tailBottomRight = Offset(size.width * 0.65, size.height * 0.45);
    Offset tailUpperRight = Offset(size.width, 0);

    if(AppTheme.instance!.useMobileLayout) {
      tailBottomLeft = Offset(size.width * 0.30, size.height * 0.35);
      tailCenter = Offset(size.width * 0.5, size.height * 0.15);
      tailBottomRight = Offset(size.width * 0.70, size.height * 0.35);
      tailUpperRight = Offset(size.width, 0);
    }

    var path = Path();

    path.lineTo(tailBottomLeft.dx, tailBottomLeft.dy);
    path.lineTo(tailCenter.dx, tailCenter.dy);
    path.lineTo(tailBottomRight.dx, tailBottomRight.dy);
    path.lineTo(tailUpperRight.dx, tailUpperRight.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(_TailShapePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TailShapePainter oldDelegate) => false;
}
