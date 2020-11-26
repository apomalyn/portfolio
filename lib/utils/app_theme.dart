import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme _instance;

  static AppTheme get instance {
    if (_instance == null) {
      _instance = AppTheme();
    }
    return _instance;
  }

  static const Color lightBlack = Color(0xff282626);
  static const Color white = Color(0xfff3efeb);
  static const Color gold = Color(0xfff8ab34);
  static const Color orange = Color(0xfff08122);
  static const Color orangeRed = Color(0xffe95527);

  static ThemeData theme = ThemeData(
      backgroundColor: lightBlack,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: lightBlack, fontSize: 96, fontFamily: 'JetBrainsMono'),
          headline2: TextStyle(
              color: lightBlack, fontSize: 60, fontFamily: 'JetBrainsMono'),
          headline3: TextStyle(
              color: lightBlack, fontSize: 48, fontFamily: 'JetBrainsMono'),
          headline4: TextStyle(
              color: lightBlack, fontSize: 34, fontFamily: 'JetBrainsMono'),
          headline5: TextStyle(
              color: lightBlack, fontSize: 24, fontFamily: 'JetBrainsMono'),
          headline6: TextStyle(
              color: lightBlack, fontSize: 20, fontFamily: 'JetBrainsMono'),
          bodyText1: TextStyle(
              color: lightBlack,
              fontSize: 14,
              height: 1.75,
              fontFamily: 'Montserrat')));

  Size _size;

  void init(MediaQueryData data) {
    _size = data.size;
  }

  EdgeInsets get sectionSpacing {
    //if (data.size.width > 950) {
    return EdgeInsets.fromLTRB(largeHorizontalSpacing, largeVerticalSpacing,
        largeHorizontalSpacing, largeVerticalSpacing);
    //}

    // if (data.size.width > 600) {
    //   return DeviceScreenType.Tablet;
    // }
    //
    // return DeviceScreenType.Mobile;
  }

  double get largeVerticalSpacing => _size.height * 0.1;

  double get mediumVerticalSpacing => _size.height * 0.05;

  double get smallVerticalSpacing => _size.height * 0.03;

  double get largeHorizontalSpacing => _size.width * 0.15;

  double get mediumHorizontalSpacing => _size.width * 0.05;

  double get smallHorizontalSpacing => _size.width * 0.03;
}
