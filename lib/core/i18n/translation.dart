import 'contexts/landing_screen.strings.dart';
import 'contexts/sign_up_screen.strings.dart';
import 'contexts/validators.strings.dart';

class StringsI18n {
  final LandingScreenStrings landing;
  final SignUpScreenStrings signUp;
  final ValidatorsStrings validators;

  StringsI18n({
    required this.landing,
    required this.signUp,
    required this.validators,
  });
}

abstract class StringsTranslations {
  StringsI18n get strings;
}
