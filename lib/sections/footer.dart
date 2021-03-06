import 'package:flutter/material.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/embellishment/tail_section_shape.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final TextStyle _whiteHeadlineStyle = AppTheme
      .instance.theme.textTheme.headline6
      .copyWith(color: AppTheme.white);

  final TextStyle _whiteTextStyle = AppTheme.instance.theme.textTheme.bodyText1
      .copyWith(color: AppTheme.white);

  final TextStyle _orangeHeadlineStyle = AppTheme
      .instance.theme.textTheme.headline6
      .copyWith(color: AppTheme.orangeRed);

  @override
  Widget build(BuildContext context) {
    return TailSectionShape(
      color: AppTheme.lightBlack,
      child: Container(
        width: AppTheme.instance.size.width,
        child: Padding(
          padding: AppTheme.instance.sectionSpacing,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: AppTheme.instance.useMobileLayout
                      ? AppTheme.instance.largeVerticalSpacing * 1.5
                      : AppTheme.instance.largeVerticalSpacing),
              Image.asset('assets/logos/fox.png', width: 92, height: 92),
              SizedBox(height: AppTheme.instance.smallVerticalSpacing),
              RichText(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  text: TextSpan(
                      text: "${AppIntl.of(context).firstname} ",
                      style: _whiteHeadlineStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: AppIntl.of(context).lastname,
                            style: _orangeHeadlineStyle)
                      ])),
              Text(AppIntl.of(context).landing_subtitle_part_1,
                  style: _whiteHeadlineStyle, textAlign: TextAlign.center),
              Text(AppIntl.of(context).landing_subtitle_part_2,
                  style: _orangeHeadlineStyle, textAlign: TextAlign.center),
              SizedBox(height: AppTheme.instance.smallVerticalSpacing),
              InkWell(
                onTap: () => _launchUrl(Urls.email),
                child: Text(Urls.email.substring(7), style: _whiteTextStyle),
              ),
              SizedBox(height: AppTheme.instance.smallVerticalSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                      Urls.githubProfile,
                      AppIntl.of(context).footer_github_tooltip,
                      "assets/logos/github_white_mark.png"),
                  _buildSocialButton(
                      Urls.twitterProfile,
                      AppIntl.of(context).footer_twitter_tooltip,
                      "assets/logos/twitter_logo.png"),
                  _buildSocialButton(
                      Urls.linkedInProfile,
                      AppIntl.of(context).footer_linkedin_tooltip,
                      "assets/logos/linkedin_logo.png")
                ],
              ),
              SizedBox(height: AppTheme.instance.smallVerticalSpacing),
              Text(AppIntl.of(context).footer_copyright,
                  style: _whiteTextStyle, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    await launch(url);
  }

  Widget _buildSocialButton(String url, String tooltip, String imagePath) =>
      IconButton(
        onPressed: () => _launchUrl(url),
        tooltip: tooltip,
        icon: Image.asset(imagePath),
      );
}
