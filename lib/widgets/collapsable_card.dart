import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// Vertical space between the elements of the card.
const double _verticalSpace = 20;

class CollapsableCard extends StatefulWidget {
  /// Image present on top of the card
  final String image; // TODO make it not required

  /// Semantics label of the [image]. Required if [image] is provided.
  final String? semanticsImageLabel;

  /// Title of the card, the [title] is situated under the [image]
  final Text title;

  /// Text that will appear under the [title], by default the [details] are ellipsis if superior to [maxLines].
  final String details;

  /// Number of line [details] visible
  final int maxLines;

  /// Url to open when [image] is tapped
  final String? url;

  const CollapsableCard(
      {required this.title,
      required this.details,
      required this.image,
      this.semanticsImageLabel,
      this.maxLines = 3,
      this.url});

  @override
  _CollapsableCardState createState() => _CollapsableCardState();
}

class _CollapsableCardState extends State<CollapsableCard> {
  bool _isExpanded = false;

  bool _arrowIsHovered = false;

  final Duration _animationDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: _handleTap,
        onHover: (value) {
          setState(() {
            _arrowIsHovered = value;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: _verticalSpace),
                InkWell(
                  onTap: widget.url != null ? _handleImageTap : null,
                  hoverColor: Colors.transparent,
                  child: Container(
                      width: 250,
                      height: 150,
                      child: Image.asset(widget.image,
                          semanticLabel: widget.semanticsImageLabel)),
                ),
                const SizedBox(height: _verticalSpace),
                widget.title,
                const SizedBox(height: _verticalSpace),
                AnimatedContainer(
                  duration: _animationDuration,
                  //height: getHeight(), TODO find a way to determine the correct size of the collapsed and the expanded state
                  child: Text(
                    widget.details,
                    maxLines: _isExpanded ? 2 ^ 64 : widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: _verticalSpace),
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: _handleTap,
                      onHover: (value) {
                        setState(() {
                          _arrowIsHovered = value;
                        });
                      },
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: _arrowIsHovered ? AppTheme.orange : Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _handleImageTap() async {
    if (widget.url != null) {
      if (await canLaunch(widget.url!)) {
        await launch(widget.url!);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    }
  }
}
