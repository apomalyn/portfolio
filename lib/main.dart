import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/providers/locale_provider.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/footer.dart';
import 'package:portfolio/sections/journey.dart';
import 'package:portfolio/sections/landing.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/volunteer_experiences.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_intl.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<LocaleProvider>(),
      child: Consumer<LocaleProvider>(
        builder: (context, provider, child) => MaterialApp(
          title: 'Xavier Chrétien',
          theme: AppTheme.desktopTheme,
          locale: Provider.of<LocaleProvider>(context).locale,
          localizationsDelegates: const [
            AppIntl.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: AppIntl.supportedLocales,
          home: Portfolio(),
        ),
      ),
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
          child: Column(
            children: [
              ApplicationBar(),
              LandingSection(appBarHeight: kToolbarHeight),
              ProjectsSection(),
              AboutSection(),
              VolunteerExperiencesSection(),
              JourneySection(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

}
