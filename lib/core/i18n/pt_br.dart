import 'contexts/landing_screen.strings.dart';
import 'contexts/login_screen.strings.dart';
import 'contexts/sign_up_screen.strings.dart';
import 'contexts/validators.strings.dart';
import 'translation.dart';

class PtBrStringsTranslations implements StringsTranslations {
  static const String getLocale = 'pt_BR';

  static const title = 'Kat Wallet';

  final landingScreen = LandingScreenStrings(
    title: title,
    titleBodyText: 'Bem-vindo!',
    bodyText:
        'Simplifique suas finanças com facilidade. Controle seus pagamentos e cobranças em um só lugar. Interface intuitiva e amigável para gerenciar suas transações. Experimente agora mesmo! ',
    joinNowButton: 'Junte-se agora',
    signInButton: 'Já tem uma conta? Faça login',
  );

  final login = LoginScreenStrings(
    title: title,
    userNameLabel: 'E-mail',
    passwordLabel: 'Senha',
    loginButtonLabel: 'Entrar',
  );

  final signUp = SignUpScreenStrings(
    title: 'Registre-se',
    emailLabelField: 'E-mail',
    passwordLabelField: 'Senha',
    signUpButton: 'Registrar',
  );

  final validators = ValidatorsStrings(
    emailIsInvalid: 'Formato de email inválido',
    emailIsRequired: 'Email é obrigatório',
    invalidPassword: 'Senha inválida: Pelo menos 6 caracteres',
    required: 'Campo é obrigatório',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(
      landing: landingScreen,
      login: login,
      signUp: signUp,
      validators: validators,
    );
  }
}
