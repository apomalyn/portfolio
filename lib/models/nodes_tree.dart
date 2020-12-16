
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:portfolio/models/node_data.dart';

class NodesTree {

  List<NodeData> nodes;

  LinkedHashMap<int, _YearToDraw> _yearsTrimmed = Map<int, _YearToDraw>();
  LinkedHashMap<int, _YearToDraw> get yearsTrimmed => _yearsTrimmed;


  NodesTree(this.nodes) {
    buildYearsToDraw(this._yearsTrimmed);
    trimUnchangedYears(this._yearsTrimmed);
  }

  @visibleForTesting
  buildYearsToDraw(LinkedHashMap<int, _YearToDraw> yearsToDraw) {
    for (NodeData node in this.nodes) {
      yearsToDraw.update(node.startingAt.year, (value) {
        value.nodes.add(node);
        return value;
      }, ifAbsent: () {
        var year = _YearToDraw(node.startingAt.year);
        year.nodes.add(node);

        return year;
      });

      // If the node convert more than one year
      if (node.endingAt.year > node.startingAt.year) {
        for (int i = node.startingAt.year + 1; i <= node.endingAt.year; i++) {
          yearsToDraw.update(i, (value) {
            value.nodes.add(node);
            return value;
          }, ifAbsent: () {
            var year = _YearToDraw(i);
            year.nodes.add(node);

            return year;
          });
        }
      }
    }
  }

  /// Remove years without any change to avoid drawing multiple identical years.
  @visibleForTesting
  trimUnchangedYears(LinkedHashMap<int, _YearToDraw> years) {
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
}

/// Data class used only for this painter.
/// Represent a year to draw on the tree.
class _YearToDraw {
  final int year;

  List<NodeData> nodes = [];

  bool beginThisYear(NodeData node) => node.startingAt.year == year;

  bool endThisYear(NodeData node) {
    if (year == DateTime.now().year) {
      return node.endingAt.month != DateTime.now().month;
    }
    return node.endingAt.year == year;
  }

  _YearToDraw(this.year);
}
