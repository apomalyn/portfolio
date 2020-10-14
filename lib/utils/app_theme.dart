
import 'package:flutter/material.dart';

class AppTheme {

  static const Color lightBlack = Color(0xff282626);
  static const Color white = Color(0xfff3efeb);
  static const Color gold = Color(0xfff8ab34);
  static const Color orange = Color(0xfff08122);
  static const Color orangeRed = Color(0xffe95527);

  static ThemeData theme = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'JetBrainsMono',
      textTheme: TextTheme(
        headline1: TextStyle(color: lightBlack, fontSize: 96),
        headline2: TextStyle(color: lightBlack, fontSize: 60),
        headline3: TextStyle(color: lightBlack, fontSize: 48),
        headline4: TextStyle(color: lightBlack, fontSize: 34),
        headline5: TextStyle(color: lightBlack, fontSize: 24),
        headline6: TextStyle(color: lightBlack, fontSize: 20),
      )
  );
}
