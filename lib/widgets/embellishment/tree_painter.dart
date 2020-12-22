import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/models/nodes_tree.dart';
import 'package:portfolio/models/node_data.dart';
import 'package:portfolio/utils/app_theme.dart';

class TreePainter extends CustomPainter {
  /// Radius of the point representing the beginning and the end of a node on the main timeline
  final double _nodePointRadius = 7;

  /// Width of the central timeline.
  final double _timelineWidth = 7;

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.bevel;

  /// Contains all the data needed to draw the tree.
  final NodesTree tree;

  /// Space occupied vertically by a year.
  final double yearSpace;

  final Offset curveDelta;

  TreePainter({@required this.tree, @required this.yearSpace, this.curveDelta});

  @override
  void paint(Canvas canvas, Size size) {
    // Initialize
    _paint.color = AppTheme.lightBlack;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = _timelineWidth;

    // Draw middle separation
    canvas.drawLine(Offset(size.width / 2, 0.0),
        Offset(size.width / 2, size.height), _paint);

    _paint.color = AppTheme.orangeRed;
    _paint.style = PaintingStyle.fill;

    Path path = Path();
    Offset currentYearOffset = Offset(size.width / 2, 0.0);

    tree.yearsTrimmed.forEach((key, year) {
      // Drawing year point
      _paint.color = AppTheme.orange;
      canvas.drawCircle(currentYearOffset, 10, _paint);
      _paint.color = AppTheme.orangeRed;

      for (NodeData node in year.nodes) {
        Offset currentPosition =
            Offset(currentYearOffset.dx, currentYearOffset.dy);
        double changeOfSign = node.isOnLeft ? -1.0 : 1.0;

        if (year.beginThisYear(node)) {
          currentPosition = node.startingPoint
              .translate((-changeOfSign) * curveDelta.dx, curveDelta.dy);

          // Move to the correct position
          path.moveTo(currentPosition.dx, currentPosition.dy);
          // Add beginning of the node
          currentPosition = _drawCurve(path, currentPosition, node.isOnLeft,
              currentYearOffset, false, canvas);
        } else {
          // Set the position if the node didn't start this year
          currentPosition = currentPosition.translate(
              (node.level + 1) * (changeOfSign * curveDelta.dx), 0.0);
          path.moveTo(currentPosition.dx, currentPosition.dy);
        }

        // Straight line
        currentPosition =
            Offset(currentPosition.dx, currentYearOffset.dy + yearSpace);
        if (year.endThisYear(node)) {
          currentPosition = node.endingPoint.translate(0.0, -curveDelta.dy);
        }
        path.lineTo(currentPosition.dx, currentPosition.dy);

        // End of the node
        if (year.endThisYear(node)) {
          // Add end of the node and the point on the main line
          _drawCurve(path, currentPosition, node.isOnLeft, currentYearOffset,
              true, canvas);
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
          currentPosition.dy + (curveDelta.dy * 0.75),
          rootPosition.dx,
          currentPosition.dy + (curveDelta.dy * 0.25),
          rootPosition.dx,
          currentPosition.dy + curveDelta.dy);
      canvas.drawCircle(
          Offset(rootPosition.dx, currentPosition.dy + curveDelta.dy),
          _nodePointRadius,
          _paint);
    } else {
      if (currentPosition.dx == rootPosition.dx) {
        canvas.drawCircle(currentPosition, _nodePointRadius, _paint);
      }
      path.cubicTo(
          currentPosition.dx,
          currentPosition.dy + (curveDelta.dy * 0.75),
          currentPosition.dx + (changeOfSign * curveDelta.dx),
          currentPosition.dy + (curveDelta.dy * 0.25),
          currentPosition.dx + (changeOfSign * curveDelta.dx),
          currentPosition.dy + curveDelta.dy);
    }

    return currentPosition.translate(
        changeOfSign * curveDelta.dx, curveDelta.dy);
  }
}
