import 'package:flutter/material.dart';
import 'package:portfolio/constants/projects_data.dart';
import 'package:portfolio/models/project_data.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: AppTheme.white,
      child: Padding(
        padding: AppTheme.instance.sectionSpacing,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppIntl.of(context).projects_title, style: AppTheme.theme.textTheme.headline2),
            SizedBox(height: AppTheme.instance.largeVerticalSpacing),
            Center(
              child: Wrap(
                spacing: 50,
                children: _buildProjectCards(projectsData),
              ),
            )
          ],
        )
      ),
    );
  }

  List<Widget> _buildProjectCards(List<ProjectData> datas) {
    List<Widget> projects = [];

    for(ProjectData data in datas) {
      projects.add(ProjectCard(backgroundColor: data.backgroundColor, projectData: data));
    }

    return projects;
  }
}
