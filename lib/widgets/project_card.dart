import 'package:flutter/material.dart';
import 'package:portfolio/models/project_data.dart';
import 'package:portfolio/generated/l10n.dart';

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
  bool _isHover = false;

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
        child: InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          onHover: (value) {
            setState(() {
              this._isHover = value;
            });
          },
          child: SizedBox(
              height: 250,
              width: 450,
              child: Stack(children: [
                AnimatedOpacity(
                    opacity: this._isHover ? 0.0 : 1.0,
                    duration: hoverDuration,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(widget.projectData.logoPath),
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
              ])),
        ),
      );

  Widget hovered() => AnimatedOpacity(
        opacity: this._isHover ? 1.0 : 0.0,
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

  Widget _buildActionButtons() {
    List<Widget> actions = [];

    if (widget.projectData.otherUrl.isNotEmpty) {
      actions.add(IconButton(
          icon: widget.projectData.otherUrlIcon,
          tooltip: widget.projectData.otherUrlTooltip,
          onPressed: () => print("${widget.projectData.name} other link tapped!")));
    }

    if (widget.projectData.githubUrl.isNotEmpty) {
      actions.add(IconButton(
        icon: ImageIcon(AssetImage("assets/logos/github_mark.png")),
        tooltip: AppIntl.current.github_tooltip,
        onPressed: () => print("${widget.projectData.name} github tapped!"),
      ));
    }

    print("${widget.projectData.name} -- ${actions.length}");

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
}
