import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/embellishment/dash_circle.dart';
import 'package:portfolio/widgets/embellishment/dot.dart';
import 'package:portfolio/widgets/scroll_down_animated.dart';

class LandingSection extends StatelessWidget {
  final TextStyle _titleWhiteStyle = AppTheme.instance.theme.textTheme.headline1
      .copyWith(color: AppTheme.white);

  final TextStyle _titleOrangeStyle = AppTheme
      .instance.theme.textTheme.headline1
      .copyWith(color: AppTheme.orangeRed);

  /// Used to determine the exact height available for the section.
  final appBarHeight;

  LandingSection({@required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height - this.appBarHeight;

    List<Widget> content = [];

    // Adding embellishment if on desktop
    if (!AppTheme.instance.useMobileLayout) {
      content.addAll(_buildEmbellishment(size.width));
    }
    content.add(_buildTitle());
    content.add(Positioned(
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.all(AppTheme.instance.smallVerticalSpacing / 2),
          child: ScrollDownAnimated(),
        )));

    return Container(
      height: height,
      width: size.width,
      color: AppTheme.lightBlack,
      child: Stack(
        alignment: Alignment.center,
        children: content,
      ),
    );
  }

  Widget _buildTitle() => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: AppTheme.instance.sectionSpacing,
          child: Wrap(
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppTheme.instance.smallHorizontalSpacing,
              runSpacing: AppTheme.instance.mediumVerticalSpacing,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: AppTheme.instance.useMobileLayout
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RichText(
                          textAlign: AppTheme.instance.useMobileLayout
                              ? TextAlign.center
                              : TextAlign.start,
                          softWrap: true,
                          text: TextSpan(
                              text: "${AppIntl.current.firstname} ",
                              style: _titleWhiteStyle,
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppIntl.current.lastname,
                                    style: _titleOrangeStyle)
                              ])),
                    ),
                    Flexible(
                      child: RichText(
                          textAlign: AppTheme.instance.useMobileLayout
                              ? TextAlign.center
                              : TextAlign.start,
                          softWrap: true,
                          text: TextSpan(
                              text: AppIntl.current.landing_subtitle_part_1,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        AppIntl.current.landing_subtitle_part_2,
                                    style: _titleOrangeStyle)
                              ],
                              style: _titleWhiteStyle)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/banner.png', scale: 2.7)
                  ],
                )
              ]),
        ),
      );

  List<Widget> _buildEmbellishment(double width) => [
          Positioned(
          bottom: 0,
          left: 0,
          child: DashedArc(
            250,
            startAngle: 270,
            angleBetweenDash: 2,
            sizeDash: 3,
            strokeWidth: 2,
            arcCenter: Offset(0, 500),
          ),
        ),
        Positioned(
          top: AppTheme.instance.largeVerticalSpacing * 1.5,
          left: AppTheme.instance.mediumHorizontalSpacing * 1.5,
          child: Dot(20),
        ),
        if (width > 1610)
          Positioned(
            bottom: AppTheme.instance.largeVerticalSpacing * 2,
            left: AppTheme.instance.largeHorizontalSpacing * 4,
            child: Dot(20, color: AppTheme.orange),
          ),
      ];
}
