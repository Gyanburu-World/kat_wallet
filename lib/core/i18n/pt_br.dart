import 'contexts/landing_screen.strings.dart';
import 'contexts/login_screen.strings.dart';
import 'contexts/sign_up_screen.strings.dart';
import 'contexts/validators.strings.dart';
import 'translation.dart';

class PtBrStringsTranslations implements StringsTranslations {
  static const String getLocale = 'pt_BR';

  final landingScreen = LandingScreenStrings(
    title: 'Kat Delivery',
    titleBodyText: 'Bem-vindo!',
    bodyText:
        'Se você faz parte da central, nosso aplicativo permite que você gerencie seus clientes, produtos e pedidos. Já se você é responsável pelas entregas, utilize-o para controlar todas as entregas necessárias, facilitando o processo ao anexar comprovantes e automatizar o fluxo.',
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
    centralCheckboxLabel: 'Sou a central',
    cashierCheckboxLabel: 'Sou caixa',
    deliverymanCheckboxLabel: 'Sou entregador',
    centralField: 'Usuario da central',
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
