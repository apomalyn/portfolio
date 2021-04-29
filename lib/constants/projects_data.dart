import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/models/project_data.dart';

List<ProjectData> projectsData(AppIntl intl) => [
  // ÉTSMobile
  ProjectData(
      name: intl.project_etsmobile_title,
      descriptionIntl: intl.project_etsmobile_description,
      logoPath: "assets/logos/ets_white_logo.png",
      githubUrl: "https://github.com/applets/Notre-Dame",
      backgroundColor: Color(0xffef3c43)),

  // Cinet
  ProjectData(
      name: intl.project_cinet_title,
      descriptionIntl: intl.project_cinet_description,
      logoPath: "assets/logos/cinet_logo.png",
      githubUrl: "https://github.com/apomalyn/cinet",
      otherUrl: "https://www.facebook.com/laurence.sibelle.14/videos/800483494100525/",
      otherUrlIcon: Icon(Icons.movie_creation_outlined, color: Colors.white),
      otherUrlTooltip: intl.project_cinet_tooltip,
      backgroundColor: Color(0xff555b6e)),

  // Tragile
  ProjectData(
      name: intl.project_tragile_title,
      descriptionIntl: intl.project_tragile_description,
      logoPath: "assets/logos/tragile_logo.png",
      githubUrl: "https://github.com/eyjafjoll/HackQC19-UI",
      otherUrl: "https://www.etsmtl.ca/en/news/2019/competition-hackqc2019-ets/",
      otherUrlIcon: Icon(Icons.article_outlined, color: Colors.white),
      otherUrlTooltip: intl.project_tragile_tooltip,
      backgroundColor: Color(0xff43a047)),
];
