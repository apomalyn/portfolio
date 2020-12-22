import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/journey_nodes_data.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/models/node_data.dart';
import 'package:portfolio/models/nodes_tree.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/node_circle_animated.dart';

import 'embellishment/tree_painter.dart';

class JourneyTree extends StatefulWidget {
  _JourneyTreeState createState() => _JourneyTreeState();
}

class _JourneyTreeState extends State<JourneyTree> {
  final NodesTree tree = NodesTree(nodes);

  Offset _curveDelta;

  double _yearSpace;

  @override
  Widget build(BuildContext context) {
    _yearSpace = AppTheme.instance.size.height * 0.30;
    _curveDelta = AppTheme.instance.useMobileLayout
        ? Offset(50, 50)
        : Offset(max(AppTheme.instance.size.width * 0.06, 75), 75);

    tree.determineNodesPosition(
        _curveDelta,
        _yearSpace,
        AppTheme.instance.size.width -
            AppTheme.instance.largeHorizontalSpacing *
                2); // Remove the section padding.

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppIntl.of(context).journey_education,
                style: AppTheme.instance.theme.textTheme.headline4),
            SizedBox(width: AppTheme.instance.mediumHorizontalSpacing),
            Text(AppIntl.of(context).journey_experience,
                style: AppTheme.instance.theme.textTheme.headline4),
          ],
        ),
        SizedBox(height: AppTheme.instance.smallVerticalSpacing),
        SizedBox(
          height:
              AppTheme.instance.size.height * 0.30 * tree.yearsTrimmed.length,
          child: CustomPaint(
            willChange: false,
            isComplex: true,
            painter: TreePainter(
                tree: tree, yearSpace: _yearSpace, curveDelta: _curveDelta),
            child: Stack(
              children: _buildNodeCircle(),
            ),
          ),
        ),
        SizedBox(height: AppTheme.instance.smallVerticalSpacing),
        Text(AppIntl.of(context).journey_now,
            style: AppTheme.instance.theme.textTheme.headline4)
      ],
    );
  }

  List<Widget> _buildNodeCircle() {
    List<Widget> list = [];

    for (NodeData node in tree.nodes) {
      list.add(Positioned(
          top: node.middlePoint.dy,
          left: node.middlePoint.dx - 37.5,
          child: NodeCircleAnimated(node)));
    }

    if (!AppTheme.instance.useMobileLayout) {
      int i = 0;
      for (int year in tree.yearsTrimmed.keys) {
        list.add(Positioned(
          left: (AppTheme.instance.size.width -
                  AppTheme.instance.largeHorizontalSpacing * 1.8) /
              2,
          top: _yearSpace * i,
          child:
              Text("$year", style: AppTheme.instance.theme.textTheme.headline5),
        ));
        i++;
      }
    }

    return list;
  }
}
