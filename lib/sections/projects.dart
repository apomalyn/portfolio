import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project_data.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ProjectData data = ProjectData(name: "ÉTSMobile", descriptionIntl: "This is a description", logoPath: "assets/logos/ets_white_logo.png");

    return Container(
      height: size.height,
      width: size.width,
      child: Center(
        child: Column(
          children: [
            Text(AppIntl.of(context).projects_title),
            SizedBox(height: 100),
            ProjectCard(backgroundColor: Color(0xffef3c43), projectData: data)
          ],
        )
      ),
    );
  }
}
