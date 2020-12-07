import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/landing.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/volunteer_experiences.dart';
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
      theme: AppTheme.desktopTheme,
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

    AppBar appBar = AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/logos/fox.png', width: 24, height: 24),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              appBar,
              LandingSection(appBarHeight: appBar.preferredSize.height),
              ProjectsSection(),
              AboutSection(),
              VolunteerExperiencesSection()
            ],
          ),
        ),
      ),
    );
  }

}
