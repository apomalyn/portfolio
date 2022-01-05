import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_theme.dart';

class CircleImageAnimated extends StatefulWidget {
  final ImageProvider image;

  final Color hoverColor;

  final bool zoomOnHover;

  final double radius;

  const CircleImageAnimated(this.image,
      {Key? key,
      required this.hoverColor,
      required this.zoomOnHover,
      required this.radius})
      : super(key: key);

  @override
  _CircleImageAnimatedState createState() => _CircleImageAnimatedState();
}

class _CircleImageAnimatedState extends State<CircleImageAnimated> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Container(
          width: 2 * (widget.radius + 10),
          height: 2 * (widget.radius + 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                width: _isHovered ? 2 * (widget.radius + 10) : 2 * (widget.radius),
                height: _isHovered ? 2 * (widget.radius + 10) : 2 * (widget.radius),
                duration: Duration(milliseconds: 125),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.radius + 10)),
                    color: AppTheme.orange),
              ),
              CircleAvatar(
                backgroundImage: widget.image,
                radius: widget.radius,
              )
            ],
          ),
        ),
      );

  void _mouseEnter(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }
}
