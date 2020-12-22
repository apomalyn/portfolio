import 'package:flutter/material.dart';
import 'package:portfolio/models/node_data.dart';
import 'package:portfolio/utils/app_theme.dart';

class NodeCircleAnimated extends StatefulWidget {
  final NodeData node;

  NodeCircleAnimated(this.node);

  _NodeCircleAnimatedState createState() => _NodeCircleAnimatedState();
}

class _NodeCircleAnimatedState extends State<NodeCircleAnimated> {
  /// Indicate if the card containing the description of the node is visible.
  bool _cardVisible = false;

  bool _isHovered = false;

  TextStyle _defaultStyle = AppTheme.instance.theme.textTheme.headline6;

  Color _defaultColor = Colors.white;

  TextStyle _cardVisibleStyle = AppTheme.instance.theme.textTheme.headline6
      .copyWith(color: AppTheme.white);

  TextStyle _cardStyle = AppTheme.instance.theme.textTheme.bodyText1
      .copyWith(color: AppTheme.white);

  Color _cardVisibleColor = AppTheme.lightBlack;

  @override
  Widget build(BuildContext context) {
    return AppTheme.instance.useMobileLayout
        ? GestureDetector(
            onTap: () => _handleAction(!_cardVisible),
            child: _buildContent(),
          )
        : MouseRegion(
            onEnter: (e) => _handleAction(true),
            onExit: (e) => _handleAction(false),
            child: _buildContent());
  }

  _buildContent() => Card(
    shape: CircleBorder(),
    elevation: 5.0,
    color: _cardVisible ? _cardVisibleColor : _defaultColor,
    child: SizedBox(
      width: 65,
      height: 65,
      child: Center(
        child: Text(widget.node.shortTitle,
            style: _cardVisible ? _cardVisibleStyle : _defaultStyle,
            semanticsLabel: widget.node.title),
      ),
    ),
  );

  _handleAction(bool isVisible) {
    setState(() {
      _cardVisible = isVisible;
    });
  }
}
