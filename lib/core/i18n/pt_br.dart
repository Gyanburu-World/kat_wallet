import 'contexts/landing_screen.strings.dart';
import 'contexts/login_screen.strings.dart';
import 'contexts/sign_up_screen.strings.dart';
import 'contexts/validators.strings.dart';
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

  final login = LoginScreenStrings(
    userNameLabel: 'Nome de Usuario',
    passwordLabel: 'Senha',
    loginButtonLabel: 'Entrar',
  );

  final signUp = SignUpScreenStrings(
    title: 'Registre-se',
    usernameLabelField: 'Nome de Usuario',
    nicknameLabelField: 'Apelido',
    emailLabelField: 'E-mail',
    passwordLabelField: 'Senha',
    signUpButton: 'Registrar',
    majorCheckField: 'Eu tenho um superior',
    majorField: 'Nome de Usuario do Superior',
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
