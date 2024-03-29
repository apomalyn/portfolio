import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/circle_image_animated.dart';
import 'package:portfolio/widgets/embellishment/w_painter.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: AppTheme.lightBlack,
      child: Padding(
          padding: AppTheme.instance!.sectionSpacing,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: AppTheme.instance!.largeVerticalSpacing,
                  runSpacing: AppTheme.instance!.largeVerticalSpacing,
                  alignment: WrapAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${AppIntl.of(context)!.firstname} ${AppIntl.of(context)!.lastname}.",
                            textAlign: TextAlign.start,
                            style: AppTheme.instance!.theme.textTheme.displayMedium!
                                .copyWith(color: AppTheme.white)),
                        SizedBox(
                            height: AppTheme.instance!.mediumVerticalSpacing),
                        Container(
                          width: size.width > 685
                              ? size.width * 0.30
                              : size.width * 0.8,
                          child: Text(
                              AppIntl.of(context)!.about_first_paragraph,
                              style: AppTheme.instance!.theme.textTheme.bodyLarge!
                                  .copyWith(color: AppTheme.white),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade),
                        ),
                        SizedBox(
                            height: AppTheme.instance!.smallVerticalSpacing),
                        if (AppIntl.of(context)!
                            .about_second_paragraph
                            .isNotEmpty)
                          Container(
                            width: size.width > 685
                                ? size.width * 0.30
                                : size.width * 0.8,
                            child: Text(
                                AppIntl.of(context)!.about_second_paragraph,
                                style: AppTheme
                                    .instance!.theme.textTheme.bodyLarge!
                                    .copyWith(color: AppTheme.white),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.fade),
                          )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleImageAnimated(
                            AssetImage('assets/images/picture_account.jpg'),
                            hoverColor: AppTheme.orange,
                            zoomOnHover: true,
                            radius: 150),
                        W(width: 100, radians: 0.25)
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
