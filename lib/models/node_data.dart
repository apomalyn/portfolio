import 'package:flutter/material.dart';

class NodeData {
  /// The current node is based on which other node. If null, the node is based on root
  final NodeData basedOn;

  bool get isBasedOnRoot => basedOn == null;

  /// When the node is created
  final DateTime startingAt;

  /// When the node finished
  final DateTime endingAt;

  /// Description of the node, should be visible only when focused
  final String description;

  /// Short-title of the node. Visible on the node circle.
  final String shortTitle;

  /// Complete title of the node
  final String title;

  /// Is situated on the left side of the tree.
  final bool isOnLeft;

  NodeData(
      {this.basedOn,
      @required this.startingAt,
      DateTime endingAt,
      @required this.title,
      @required this.shortTitle,
      @required this.description,
      this.isOnLeft = true})
      : assert(basedOn != null && startingAt.isAfter(basedOn.startingAt)),
        this.endingAt = endingAt ?? DateTime.now();
}
