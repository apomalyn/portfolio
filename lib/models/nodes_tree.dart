import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:portfolio/models/node_data.dart';

class NodesTree {
  /// All the [nodes] that are present on the tree.
  List<NodeData> nodes;

  /// Contains all the years that include a change of node (begin or end of a node).
  LinkedHashMap<int, YearToDraw> _yearsTrimmed = Map<int, YearToDraw>();

  LinkedHashMap<int, YearToDraw> get yearsTrimmed => _yearsTrimmed;

  NodesTree(this.nodes) {
    _buildYearsToDraw(this._yearsTrimmed);
    trimUnchangedYears(this._yearsTrimmed);
  }

  /// Create a LinkedHashmap that contains the years to draw.
  _buildYearsToDraw(LinkedHashMap<int, YearToDraw> yearsToDraw) {
    for (NodeData node in this.nodes) {
      yearsToDraw.update(node.startingAt.year, (value) {
        value.nodes.add(node);
        return value;
      }, ifAbsent: () {
        var year = YearToDraw(node.startingAt.year);
        year.nodes.add(node);

        return year;
      });

      // If the node continue more than one year
      if (node.endingAt.year > node.startingAt.year) {
        for (int i = node.startingAt.year + 1; i <= node.endingAt.year; i++) {
          yearsToDraw.update(i, (value) {
            value.nodes.add(node);
            return value;
          }, ifAbsent: () {
            var year = YearToDraw(i);
            year.nodes.add(node);

            return year;
          });
        }
      }
    }
  }

  /// We don't want to draw a year that do not contains any change at all,
  /// so this function remove all these years.
  trimUnchangedYears(LinkedHashMap<int, YearToDraw> years) {
    var yearsToRemove = [];
    years.forEach((key, value) {
      for (var node in nodes) {
        if (value.beginThisYear(node) || value.endThisYear(node)) {
          return;
        }
      }
      // If there is no new node or node that end this year we can remove it from the drawing
      yearsToRemove.add(key);
    });

    years.removeWhere((key, value) => yearsToRemove.contains(key));
  }

  /// Determine the starting and ending position of each [nodes] based on the [width] available for the tree
  determineNodesPosition(Offset curveDelta, double yearSpace, double width) {
    Offset currentYearOffset = Offset(width / 2, 0.0);

    this._yearsTrimmed.forEach((key, year) {
      for (NodeData node in year.nodes) {
        Offset currentPosition =
            Offset(currentYearOffset.dx, currentYearOffset.dy);
        double changeOfSign = node.isOnLeft ? -1.0 : 1.0;

        if (year.beginThisYear(node)) {
          currentPosition = currentPosition.translate(
              changeOfSign * curveDelta.dx * (node.level + 1),
              yearSpace * monthInPerCent(node.startingAt) - curveDelta.dy);

          node.startingPoint = currentPosition;
        } else {
          // Set the position if the node didn't start this year
          currentPosition = currentPosition.translate(
              (node.level + 1) * (changeOfSign * curveDelta.dx), 0.0);
        }

        // Straight line
        currentPosition =
            Offset(currentPosition.dx, currentYearOffset.dy + yearSpace);
        node.endingPoint = currentPosition;
        if (year.endThisYear(node)) {
          currentPosition = currentPosition.translate(
              0.0,
              -(yearSpace * (1 - monthInPerCent(node.endingAt)) +
                  curveDelta.dy));
        }

        if (year.endThisYear(node)) {
          // Add end of the node and the point on the main line
          node.endingPoint = currentPosition.translate(0.0, curveDelta.dy);
        }
      }

      currentYearOffset = currentYearOffset.translate(0, yearSpace);
    });
  }

  double monthInPerCent(DateTime date) => (date.month - 1) / 11;
}

/// Data class used only for this painter.
/// Represent a year to draw on the tree.
class YearToDraw {
  final int year;

  List<NodeData> nodes = [];

  bool beginThisYear(NodeData node) => node.startingAt.year == year;

  bool endThisYear(NodeData node) {
    if (year == DateTime.now().year) {
      return node.endingAt.month != DateTime.now().month;
    }
    return node.endingAt.year == year;
  }

  YearToDraw(this.year);
}
