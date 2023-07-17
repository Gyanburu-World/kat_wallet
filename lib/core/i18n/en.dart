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

  @override
  StringsI18n get strings {
    return StringsI18n(landing: landingScreen);
  }
}
