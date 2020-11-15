import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/models/volunteer_data.dart';

List<VolunteerData> get volunteerExperiencesData => [
      // App|ETS
      VolunteerData(
          logoPath: "assets/logos/applets_logo.png",
          semanticsLabel: AppIntl.current.volunteer_applets_semanticsImageLabel,
          role: AppIntl.current.volunteer_applets_title,
          details: AppIntl.current.volunteer_applets_details,
          url: "https://www.clubapplets.ca"),

      // DSC
      VolunteerData(
          logoPath: "assets/logos/dsc.png",
          semanticsLabel: AppIntl.current.volunteer_dsc_semanticsImageLabel,
          role: AppIntl.current.volunteer_dsc_title,
          details: AppIntl.current.volunteer_dsc_details,
          url: "https://developers.google.com/community/dsc")
    ];
