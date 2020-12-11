import 'package:flutter/material.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Text(AppIntl.of(context).journey_title, style: AppTheme.instance.theme.textTheme.headline2),
            SizedBox(
              height: AppTheme.instance.largeVerticalSpacing,
            ),
            Center( // TEMPORARY
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppIntl.of(context).journey_in_dev),
                  InkWell(
                      onTap: _sendToLinkedIn,
                      child: Text(AppIntl.of(context).journey_in_dev_2, style: AppTheme.instance.theme.textTheme.bodyText1.copyWith(color: AppTheme.gold),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendToLinkedIn() async {
    await launch(Urls.linkedInProfile);
  }
}
