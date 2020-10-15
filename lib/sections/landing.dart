import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';

class LandingSection extends StatelessWidget {

  final TextStyle _titleWhiteStyle = AppTheme.theme.textTheme.headline3.copyWith(color: AppTheme.white);

  final TextStyle _titleOrangeStyle = AppTheme.theme.textTheme.headline3.copyWith(color: AppTheme.orangeRed);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(color: AppTheme.lightBlack),
      child: Stack(children: <Widget>[
        Center(
          child: Row(
            children: [
              SizedBox(width: size.width * 0.20),
              RichText(
                  text: TextSpan(
                      text: AppIntl.of(context).firstname,
                      style: _titleWhiteStyle,
                      children: <TextSpan>[
                    TextSpan(
                        text: AppIntl.of(context).lastname,
                        style: _titleOrangeStyle),
                    TextSpan(
                        text: "\n${AppIntl.of(context).landing_subtitle_part_1}",
                        style: _titleWhiteStyle),
                    TextSpan(
                        text: AppIntl.of(context).landing_subtitle_part_2,
                        style: _titleOrangeStyle)
                  ]))
            ],
          ),
        ),
      ]),
    );
  }
}
