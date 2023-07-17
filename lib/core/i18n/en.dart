import 'package:project_quest/core/i18n/screens/sign_up_screen.strings.dart';

import 'translation.dart';
import 'screens/landing_screen.strings.dart';

class EnStringsTranslations implements StringsTranslations {
  static const String getLocale = 'en-US';

  final landingScreen = LandingScreenStrings(
    title: 'Quest Land',
    titleBodyText: 'Embark on Quests',
    bodyText:
        'With a range of quests to choose from and the ability to create your own, Quest Land is the perfect platform for exploring and challenging yourself. Stay focused on your goals and join the adventure today.',
    joinNowButton: 'Join Now',
    signInButton: 'Already have an account? Sign in',
  );

  final signUp = SignUpScreenStrings(
    title: 'Register',
    userNameLabel: 'Username',
    nameLabel: 'Full Name',
    emailLabel: 'E-mail',
    passwordLabel: 'Password',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(
      landing: landingScreen,
      signUp: signUp,
    );
  }
}
