import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/models/project_data.dart';

List<ProjectData> get projectsData => [
  // ÉTSMobile
  ProjectData(
      name: AppIntl.current.project_etsmobile_title,
      descriptionIntl: AppIntl.current.project_etsmobile_description,
      logoPath: "assets/logos/ets_white_logo.png",
      githubUrl: "https://github.com/applets/Notre-Dame",
      backgroundColor: Color(0xffef3c43)),

  // Cinet
  ProjectData(
      name: AppIntl.current.project_cinet_title,
      descriptionIntl: AppIntl.current.project_cinet_description,
      logoPath: "assets/logos/cinet_logo.png",
      githubUrl: "https://github.com/apomalyn/cinet",
      otherUrl: "https://www.facebook.com/laurence.sibelle.14/videos/800483494100525/",
      otherUrlIcon: Icon(Icons.movie_creation_outlined, color: Colors.white,),
      otherUrlTooltip: AppIntl.current.project_cinet_tooltip,
      backgroundColor: Color(0xff555b6e)),
];
