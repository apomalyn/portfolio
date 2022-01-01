import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/utils/app_theme.dart';

class ScrollDownAnimated extends StatefulWidget {
  _ScrollDownAnimatedState createState() => _ScrollDownAnimatedState();
}

class _ScrollDownAnimatedState extends State<ScrollDownAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
    AnimationController(duration: const Duration(seconds: 1), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 15.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppIntl
                .of(context)!
                .landing_scroll,
                style: AppTheme.instance!.theme.textTheme.bodyText1!
                    .copyWith(color: AppTheme.white)),
            SizedBox(height: AppTheme.instance!.smallVerticalSpacing / 3),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Stack(alignment: Alignment.center, children: [
                    Positioned(
                      top: _animation.value,
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: CustomPaint(
                          willChange: false,
                          painter: _ArrowPainter(),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            )
          ],
        ),
      );
}

class _ArrowPainter extends CustomPainter {
  final Color color;

  /// Angle between the branch of the arrow
  final double angle;

  final Paint _paint = Paint();

  _ArrowPainter({this.color = AppTheme.white, this.angle = 45});

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 5;
    _paint.strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    // Determine the adjacent side of the right triangle going from the bottom center
    // of the canvas, having a opposite side of half the width of the canvas and
    // using [angle] as angle.
    double adjacent = (size.width / 2) / math.tan(this.angle * (math.pi / 180));

    var path = Path();

    // Left side
    path.moveTo(0, 0);
    path.lineTo(center.dx, adjacent);
    // Right side
    path.lineTo(size.width, 0);

    // Draw the arrow
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_ArrowPainter oldDelegate) => false;
}
