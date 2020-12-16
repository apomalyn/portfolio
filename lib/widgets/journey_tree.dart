import 'package:flutter/material.dart';
import 'package:portfolio/constants/journey_nodes_data.dart';
import 'package:portfolio/models/nodes_tree.dart';
import 'package:portfolio/utils/app_theme.dart';

import 'embellishment/tree_painter.dart';

class JourneyTree extends StatefulWidget {
  _JourneyTreeState createState() => _JourneyTreeState();
}

class _JourneyTreeState extends State<JourneyTree> {

  final NodesTree tree = NodesTree(nodes);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.instance.size.height * 0.30 * tree.yearsTrimmed.length,
      width: AppTheme.instance.size.width,
      child: CustomPaint(
        willChange: false,
        isComplex: true,
        painter: TreePainter(tree: tree),
      ),
    );
  }
}
