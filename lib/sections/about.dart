import 'package:flutter/material.dart';
import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/circle_image_animated.dart';
import 'package:portfolio/widgets/w_painter.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(color: AppTheme.lightBlack),
      child: Padding(
          padding: AppTheme.instance.sectionSpacing,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: AppTheme.instance.largeVerticalSpacing,
                  runSpacing: AppTheme.instance.largeVerticalSpacing,
                  alignment: WrapAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${AppIntl.of(context).firstname} ${AppIntl.of(context).lastname}.",
                            textAlign: TextAlign.start,
                            style: AppTheme.theme.textTheme.headline5
                                .copyWith(color: AppTheme.white)),
                        SizedBox(
                            height: AppTheme.instance.mediumVerticalSpacing),
                        Container(
                          width: size.width > 685
                              ? size.width * 0.25
                              : size.width * 0.8,
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                              style: AppTheme.theme.textTheme.bodyText1
                                  .copyWith(color: AppTheme.white),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade),
                        ),
                        SizedBox(
                            height: AppTheme.instance.smallVerticalSpacing),
                        Container(
                          width: size.width > 685
                              ? size.width * 0.25
                              : size.width * 0.8,
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                              style: AppTheme.theme.textTheme.bodyText1
                                  .copyWith(color: AppTheme.white),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleImageAnimated(AssetImage('assets/images/picture_account.jpg'), hoverColor: AppTheme.orange, zoomOnHover: true, radius: 150),
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
