import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/scroll_down_animated.dart';

class LandingSection extends StatelessWidget {
  final TextStyle _titleWhiteStyle =
      AppTheme.theme.textTheme.headline1.copyWith(color: AppTheme.white);

  final TextStyle _titleOrangeStyle =
      AppTheme.theme.textTheme.headline1.copyWith(color: AppTheme.orangeRed);

  /// Used to determine the exact height available for the section.
  final appBarHeight;

  LandingSection({@required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height - this.appBarHeight;

    return Container(
      constraints: BoxConstraints(
        minHeight: height,
      ),
      width: size.width,
      color: AppTheme.lightBlack,
      child: Padding(
        padding: AppTheme.instance.sectionSpacing,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Wrap(
                  verticalDirection: VerticalDirection.up,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: AppTheme.instance.smallHorizontalSpacing,
                  runSpacing: AppTheme.instance.mediumVerticalSpacing,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RichText(
                              textAlign: AppTheme.instance.useMobileLayout
                                  ? TextAlign.center
                                  : TextAlign.start,
                              softWrap: true,
                              text: TextSpan(
                                  text: "${AppIntl.of(context).firstname} ",
                                  style: _titleWhiteStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: AppIntl.of(context).lastname,
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
                                  text:
                                      AppIntl.of(context).landing_subtitle_part_1,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: AppIntl.of(context)
                                            .landing_subtitle_part_2,
                                        style: _titleOrangeStyle)
                                  ],
                                  style: _titleWhiteStyle)),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/banner.png', scale: 2.5)
                      ],
                    )
                  ]),
            ),
            Positioned(
                bottom: 0, child: ScrollDownAnimated())
          ],
        ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Wrap(
        //           verticalDirection: VerticalDirection.up,
        //           crossAxisAlignment: WrapCrossAlignment.center,
        //           spacing: AppTheme.instance.smallHorizontalSpacing,
        //           runSpacing: AppTheme.instance.mediumVerticalSpacing,
        //           children: <Widget>[
        //             Column(
        //               mainAxisSize: MainAxisSize.min,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Flexible(
        //                   child: RichText(
        //                       textAlign: AppTheme.instance.useMobileLayout
        //                           ? TextAlign.center
        //                           : TextAlign.start,
        //                       softWrap: true,
        //                       text: TextSpan(
        //                           text: "${AppIntl.of(context).firstname} ",
        //                           style: _titleWhiteStyle,
        //                           children: <TextSpan>[
        //                             TextSpan(
        //                                 text: AppIntl.of(context).lastname,
        //                                 style: _titleOrangeStyle)
        //                           ])),
        //                 ),
        //                 Flexible(
        //                   child: RichText(
        //                       textAlign: AppTheme.instance.useMobileLayout
        //                           ? TextAlign.center
        //                           : TextAlign.start,
        //                       softWrap: true,
        //                       text: TextSpan(
        //                           text:
        //                               AppIntl.of(context).landing_subtitle_part_1,
        //                           children: <TextSpan>[
        //                             TextSpan(
        //                                 text: AppIntl.of(context)
        //                                     .landing_subtitle_part_2,
        //                                 style: _titleOrangeStyle)
        //                           ],
        //                           style: _titleWhiteStyle)),
        //                 )
        //               ],
        //             ),
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               children: [
        //                 Image.asset('assets/images/banner.png', scale: 2.5)
        //               ],
        //             )
        //           ]),
        //       Align(
        //           alignment: Alignment.bottomCenter, child: ScrollDownAnimated())
        //     ],
        //   ),
      ),
    );
  }
}
