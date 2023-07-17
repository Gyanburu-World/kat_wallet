import 'translation.dart';
import 'screens/landing_screen.strings.dart';

class PtBrStringsTranslations implements StringsTranslations {
  static const String getLocale = 'pt_BR';

  final landingScreen = LandingScreenStrings(
    title: 'Quest Land',
    titleBodyText: 'Embarque em missões',
    bodyText:
        'Com uma variedade de missões para escolher e a capacidade de criar as suas próprias, Quest Land é a plataforma perfeita para explorar e desafiar a si mesmo. Mantenha o foco em seus objetivos e junte-se à aventura hoje mesmo.',
    joinNowButton: 'Junte-se agora',
    signInButton: 'Já tem uma conta? Faça login',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(landing: landingScreen);
  }
}
