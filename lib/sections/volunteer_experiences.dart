import 'package:flutter/material.dart';
import 'package:portfolio/constants/volunteer_experiences_data.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/models/volunteer_data.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/collapsable_card.dart';

class VolunteerExperiencesSection extends StatelessWidget {
  final TextStyle _titleOrangeStyle =
      AppTheme.instance!.theme.textTheme.headlineSmall!.copyWith(color: AppTheme.orangeRed);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: AppTheme.white,
      child: Padding(
          padding: AppTheme.instance!.sectionSpacing,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppIntl.of(context)!.volunteer_title,
                  style: AppTheme.instance!.theme.textTheme.displayMedium),
              SizedBox(height: AppTheme.instance!.largeVerticalSpacing),
              Center(
                child: Wrap(
                  runSpacing: AppTheme.instance!.mediumVerticalSpacing,
                  spacing: AppTheme.instance!.mediumHorizontalSpacing,
                  children: _buildExperiences(AppIntl.of(context)!),
                ),
              )
            ],
          )),
    );
  }

  List<Widget> _buildExperiences(AppIntl intl) {
    List<Widget> experiences = [];

    for (VolunteerData data in volunteerExperiencesData(intl)) {
      experiences.add(CollapsableCard(
          title: Text(data.role, style: _titleOrangeStyle),
          details: data.details,
          image: data.logoPath,
          semanticsImageLabel: data.semanticsLabel,
          url: data.url));
    }

    return experiences;
  }
}
