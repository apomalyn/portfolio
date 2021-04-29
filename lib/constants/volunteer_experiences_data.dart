import 'package:flutter_gen/gen_l10n/app_intl.dart';
import 'package:portfolio/models/volunteer_data.dart';

List<VolunteerData> volunteerExperiencesData(AppIntl intl) => [
      // App|ETS
      VolunteerData(
          logoPath: "assets/logos/applets_logo.png",
          semanticsLabel: intl.volunteer_applets_semanticsImageLabel,
          role: intl.volunteer_applets_title,
          details: intl.volunteer_applets_details,
          url: "https://www.clubapplets.ca"),

      // DSC
      VolunteerData(
          logoPath: "assets/logos/dsc.png",
          semanticsLabel: intl.volunteer_dsc_semanticsImageLabel,
          role: intl.volunteer_dsc_title,
          details: intl.volunteer_dsc_details,
          url: "https://developers.google.com/community/dsc")
    ];
