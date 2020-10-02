import 'package:flutter/material.dart';

class ProjectData {
  /// Name of the project
  final String name;

  /// Description of the project
  /// Intl key
  final String descriptionIntl;

  /// Url of the github project if available
  final String githubUrl;

  /// Url of the logo
  final String logoPath;

  ProjectData(
      {@required String name,
      @required String descriptionIntl,
      @required String logoPath,
      String githubUrl = ""})
      : this.name = name,
        this.descriptionIntl = descriptionIntl,
        this.githubUrl = githubUrl,
        this.logoPath = logoPath;
}
