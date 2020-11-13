import 'package:flutter/material.dart';

class ProjectData {
  /// Name of the project
  final String name;

  /// Description of the project
  final String descriptionIntl;

  /// Url of the github project if available
  final String githubUrl;

  /// Other url that describe the project
  final String otherUrl;

  /// Tooltip of the other project
  final String otherUrlTooltip;

  /// Icon that represent the other link
  final Icon otherUrlIcon;

  /// Url of the logo
  final String logoPath;

  /// Background color of the card
  final Color backgroundColor;

  ProjectData(
      {@required String name,
      @required String descriptionIntl,
      @required String logoPath,
      @required Color backgroundColor,
      String githubUrl = "",
      String otherUrl = "",
      String otherUrlTooltip = "",
      Icon otherUrlIcon})
      : this.name = name,
        this.descriptionIntl = descriptionIntl,
        this.githubUrl = githubUrl,
        this.otherUrl = otherUrl,
        this.otherUrlTooltip = otherUrlTooltip,
        this.otherUrlIcon = otherUrlIcon,
        this.logoPath = logoPath,
        this.backgroundColor = backgroundColor;
}
