import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/models/nodes_tree.dart';
import 'package:portfolio/models/node_data.dart';
import 'package:portfolio/utils/app_theme.dart';

class TreePainter extends CustomPainter {
  /// Radius of the point representing the beginning and the end of a node on the main timeline
  final double _nodePointRadius = 7;

  final double _timelineWidth = 7;

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.bevel;

  final NodesTree tree;

  Offset _curveDelta;

  TreePainter({@required this.tree});

  @override
  void paint(Canvas canvas, Size size) {
    // Initialize
    _paint.color = AppTheme.lightBlack;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = _timelineWidth;
    var yearSpace = (size.height) / (tree.yearsTrimmed.length);
    _curveDelta = AppTheme.instance.useMobileLayout ?
        Offset(70, 50):Offset(max(size.width * 0.08, 75), 75);
    print(size);

    // Draw middle separation
    canvas.drawLine(Offset(size.width / 2, 0.0),
        Offset(size.width / 2, size.height), _paint);

    _paint.color = AppTheme.orangeRed;
    _paint.style = PaintingStyle.fill;

    Path path = Path();
    Offset currentYearOffset = Offset(size.width / 2, 0.0);

    tree.yearsTrimmed.forEach((key, year) {
      print("***** Drawing $key - Starting at ${currentYearOffset.dy} ******");
      // Drawing year point
      _paint.color = AppTheme.orange;
      canvas.drawCircle(currentYearOffset, 10, _paint);
      _paint.color = AppTheme.orangeRed;

      for (NodeData node in year.nodes) {
        Offset currentPosition =
            Offset(currentYearOffset.dx, currentYearOffset.dy);
        double changeOfSign = node.isOnLeft ? -1.0 : 1.0;
        print("Drawing ${node.shortTitle}");

        if (year.beginThisYear(node)) {
          currentPosition = currentPosition.translate(
              changeOfSign * _curveDelta.dx * node.level,
              yearSpace * monthInPerCent(node.startingAt));

          // Move to the correct position
          path.moveTo(currentPosition.dx, currentPosition.dy);
          // Add beginning of the node
          currentPosition = _drawCurve(path, currentPosition, node.isOnLeft,
              currentYearOffset, false, canvas);
        } else {
          // Set the position if the node didn't start this year
          currentPosition = currentPosition.translate(
              (node.level + 1) * (changeOfSign * _curveDelta.dx), 0.0);
          path.moveTo(currentPosition.dx, currentPosition.dy);
        }

        // Straight line
        currentPosition = Offset(currentPosition.dx, currentYearOffset.dy + yearSpace);
        if (year.endThisYear(node)) {
          currentPosition = currentPosition.translate(
              0.0,
              -(yearSpace * (1 - monthInPerCent(node.endingAt)) +
                  _curveDelta.dy));
        }
        path.lineTo(currentPosition.dx, currentPosition.dy);

        // End of the node
        if (year.endThisYear(node)) {
          // Add end of the node and the point on the main line
          _drawCurve(
              path, currentPosition, node.isOnLeft, currentYearOffset, true, canvas);
        }
      }
      currentYearOffset = currentYearOffset.translate(0, yearSpace);
    });

    _paint.color = AppTheme.orangeRed;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 5;
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(TreePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TreePainter oldDelegate) => false;

  /// Drawing a curve starting from the [currentPosition] to the next level
  /// of node if [toRoot] is false, otherwise it will go to the root line.
  /// The [path] isn't move to [currentPosition].
  Offset _drawCurve(Path path, Offset currentPosition, bool isOnLeft,
      Offset rootPosition, bool toRoot, Canvas canvas) {
    var changeOfSign = 1;
    if (isOnLeft) {
      changeOfSign = -1;
    }

    if (toRoot) {
      path.cubicTo(
          currentPosition.dx,
          currentPosition.dy + (_curveDelta.dy * 0.75),
          rootPosition.dx,
          currentPosition.dy + (_curveDelta.dy * 0.25),
          rootPosition.dx,
          currentPosition.dy + _curveDelta.dy);
      canvas.drawCircle(
          Offset(rootPosition.dx, currentPosition.dy + _curveDelta.dy),
          _nodePointRadius,
          _paint);
    } else {
      if (currentPosition.dx == rootPosition.dx) {
        canvas.drawCircle(currentPosition, _nodePointRadius, _paint);
      }
      path.cubicTo(
          currentPosition.dx,
          currentPosition.dy + (_curveDelta.dy * 0.75),
          currentPosition.dx + (changeOfSign * _curveDelta.dx),
          currentPosition.dy + (_curveDelta.dy * 0.25),
          currentPosition.dx + (changeOfSign * _curveDelta.dx),
          currentPosition.dy + _curveDelta.dy);
    }

    return currentPosition.translate(
        changeOfSign * _curveDelta.dx, _curveDelta.dy);
  }

  double monthInPerCent(DateTime date) => (date.month - 1) / 11;
}
