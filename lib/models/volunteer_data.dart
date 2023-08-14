class VolunteerData {
  /// Path of the logo in the asset
  final String logoPath;

  /// Semantics label corresponding to the logo (pointed with [logoPath])
  final String semanticsLabel;

  /// Role as a volunteer
  final String role;

  /// Url of the website of the association
  final String? url;

  /// Details about what you did in the association
  final String details;

  VolunteerData(
      {required this.logoPath,
      required this.semanticsLabel,
      required this.role,
      required this.details,
      this.url});
}
