import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/sections/landing.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/utils/app_theme.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xavier Chrétien',
      theme: AppTheme.theme,
      localizationsDelegates: const [
        AppIntl.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppIntl.delegate.supportedLocales,
      home: Portfolio(),
    );
  }
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.instance.init(MediaQuery.of(context));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              LandingSection(),
              ProjectsSection()
            ],
          ),
        ),
      ),
    );
  }

}
