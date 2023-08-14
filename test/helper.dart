// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_gen/gen_l10n/app_intl.dart';


/// Load the l10n classes. Take the [child] widget to test
Widget localizedWidget({required Widget child, String locale = 'en'}) =>
    MaterialApp(
      localizationsDelegates: const [
        AppIntl.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(locale),
      home: Scaffold(body: child),
    );
