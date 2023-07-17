import 'screens/landing_screen.strings.dart';
import 'screens/sign_up_screen.strings.dart';

class StringsI18n {
  final LandingScreenStrings landing;
  final SignUpScreenStrings signUp;

  StringsI18n({
    required this.landing,
    required this.signUp,
  });
}

abstract class StringsTranslations {
  StringsI18n get strings;
}
