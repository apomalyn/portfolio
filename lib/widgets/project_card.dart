import 'package:flutter/material.dart';
import 'package:portfolio/models/project_data.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Color backgroundColor;

  final ProjectData projectData;

  final bool isTextWhite;

  const ProjectCard(
      {Key key,
      @required this.backgroundColor,
      @required this.projectData,
      this.isTextWhite = true})
      : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  final Duration hoverDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: widget.backgroundColor,
        semanticContainer: true,
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: AppTheme.instance.useMobileLayout ? GestureDetector(
          onTap: () => _mouseHover(!this._isHovered),
          child: _buildCardContent(),
        ):MouseRegion(
          onEnter: (e) => _mouseHover(true),
          onExit: (e) => _mouseHover(false),
          child: _buildCardContent()
        ),
      );

  Widget hovered() => AnimatedOpacity(
        opacity: this._isHovered ? 1.0 : 0.0,
        duration: hoverDuration,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(widget.projectData.name,
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            widget.isTextWhite ? Colors.white : Colors.black)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.projectData.descriptionIntl,
                    style: TextStyle(
                        color:
                            widget.isTextWhite ? Colors.white : Colors.black)),
              ),
            ),
            _buildActionButtons()
          ],
        ),
      );

  Widget _buildCardContent() => SizedBox(
      height: 250,
      width: 450,
      child: Stack(children: [
        AnimatedOpacity(
            opacity: this._isHovered ? 0.0 : 1.0,
            duration: hoverDuration,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(padding: EdgeInsets.all(25),child: Image.asset(widget.projectData.logoPath)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(widget.projectData.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: widget.isTextWhite
                                ? Colors.white
                                : Colors.black)),
                  ),
                )
              ],
            )),
        hovered()
      ]));

  Widget _buildActionButtons() {
    List<Widget> actions = [];

    if (widget.projectData.otherUrl.isNotEmpty) {
      actions.add(IconButton(
          icon: widget.projectData.otherUrlIcon,
          tooltip: widget.projectData.otherUrlTooltip,
          onPressed: () async {
            if (await canLaunch(widget.projectData.otherUrl)) {
              await launch(widget.projectData.otherUrl);
            } else {
              throw 'Could not launch ${widget.projectData.otherUrl}';
            }
          }));
    }

    if (widget.projectData.githubUrl.isNotEmpty) {
      actions.add(IconButton(
        icon: ImageIcon(AssetImage("assets/logos/github_mark.png")),
        tooltip: AppIntl.of(context).github_tooltip,
        onPressed: () async {
          if (await canLaunch(widget.projectData.githubUrl)) {
            await launch(widget.projectData.githubUrl);
          } else {
            throw 'Could not launch ${widget.projectData.githubUrl}';
          }
        }));
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: actions,
        ),
      ),
    );
  }

  void _mouseHover(bool hover) {
    setState(() {
      this._isHovered = hover;
    });
  }
}
