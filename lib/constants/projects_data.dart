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
      otherUrlIcon: Icon(Icons.movie_creation_outlined, color: Colors.white),
      otherUrlTooltip: AppIntl.current.project_cinet_tooltip,
      backgroundColor: Color(0xff555b6e)),

  // Tragile
  ProjectData(
      name: AppIntl.current.project_tragile_title,
      descriptionIntl: AppIntl.current.project_tragile_description,
      logoPath: "assets/logos/tragile_logo.png",
      githubUrl: "https://github.com/eyjafjoll/HackQC19-UI",
      otherUrl: "https://www.etsmtl.ca/en/news/2019/competition-hackqc2019-ets/",
      otherUrlIcon: Icon(Icons.article_outlined, color: Colors.white),
      otherUrlTooltip: AppIntl.current.project_tragile_tooltip,
      backgroundColor: Color(0xff43a047)),
];
