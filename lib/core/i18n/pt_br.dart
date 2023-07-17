import 'screens/landing_screen.strings.dart';
import 'screens/sign_up_screen.strings.dart';
import 'translation.dart';

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

  final signUp = SignUpScreenStrings(
    title: 'Registre-se',
    userNameLabel: 'Nome de Usuario',
    nameLabel: 'Nome Completo',
    emailLabel: 'E-mail',
    passwordLabel: 'Senha',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(
      landing: landingScreen,
      signUp: signUp,
    );
  }
}
