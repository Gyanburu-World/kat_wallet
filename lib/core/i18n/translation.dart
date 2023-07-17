import 'screens/landing_screen.strings.dart';

class StringsI18n {
  final LandingScreenStrings landing;

  StringsI18n({
    required this.landing,
  });
}

abstract class StringsTranslations {
  StringsI18n get strings;
}
