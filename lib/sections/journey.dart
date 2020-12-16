import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/journey_tree.dart';

class JourneySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.instance.size.width,
      color: AppTheme.white,
      child: Padding(
        padding: AppTheme.instance.sectionSpacing,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppIntl.of(context).journey_title,
                style: AppTheme.instance.theme.textTheme.headline2),
            SizedBox(
              height: AppTheme.instance.largeVerticalSpacing,
            ),
            Center(
              child: JourneyTree(),
            ),
          ],
        ),
      ),
    );
  }
}
