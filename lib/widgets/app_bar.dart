import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/providers/locale_provider.dart';
import 'package:portfolio/utils/app_theme.dart';

class ApplicationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationBarState();
}

class _ApplicationBarState extends State<ApplicationBar> {
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    if (Localizations.localeOf(context).languageCode == 'fr') {
      _locale = Locale('en');
    } else {
      _locale = Locale('fr');
    }

    return AppBar(
      backgroundColor: AppTheme.lightBlack,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/logos/fox.png', width: 24, height: 24),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: TextButton(
            onPressed: () {
              setState(() {
                locator<LocaleProvider>().changeLocale(_locale);
              });
            },
            child: Text(AppIntl.of(context)!.other_lang,
                style: AppTheme.instance!.theme.textTheme.bodyText1!
                    .copyWith(color: AppTheme.white)),
          ),
        )
      ],
    );
  }
}
