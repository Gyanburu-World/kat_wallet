import 'package:project_quest/features/auth/domain/exceptions/email_already_in_use.exception.dart';
import 'package:project_quest/features/auth/domain/exceptions/username_already_in_use.exception.dart';

import '../../../../core/abstractions/field.interface.dart';
import '../../../shared/loading/loading.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';
import '../../domain/usecases/sign_up.usecase.dart';

class SignUpController implements ISignUpController {
  final ILoadingController loading;
  final SignUpUsecase signUpUsecase;

  final IField<String> _usernameField;
  final IField<String> _nicknameField;
  final IField<String> _emailField;
  final IField<String> _passwordField;

  @override
  IField<String> get userNameField => _usernameField;

  @override
  IField<String> get nicknameField => _nicknameField;

  @override
  IField<String> get emailField => _emailField;

  @override
  IField<String> get passwordField => _passwordField;

  @override
  SignUpController({
    required IField<String> usernameField,
    required IField<String> nicknameField,
    required IField<String> emailField,
    required IField<String> passwordField,
    required this.loading,
    required this.signUpUsecase,
  })  : _usernameField = usernameField,
        _nicknameField = nicknameField,
        _emailField = emailField,
        _passwordField = passwordField;

  @override
  Future<void> signUp() async {
    try {
      loading.isLoading = true;
      if (validateFields) {
        await signUpUsecase(
          email: emailField.value!,
          nickname: nicknameField.value!,
          password: passwordField.value!,
          username: userNameField.value!,
        );
      }
    } on UsernameAlreadyInUseException catch (err) {
      _usernameField.setError(err.failure.message);
      rethrow;
    } on EmailAlreadyInUseException catch (err) {
      _emailField.setError(err.failure.message);
      rethrow;
    } catch (err) {
      rethrow;
    } finally {
      loading.isLoading = false;
    }
  }

  bool get validateFields {
    _usernameField.validate();
    _nicknameField.validate();
    _emailField.validate();
    _passwordField.validate();

    return !_usernameField.hasError &&
        !_passwordField.hasError &&
        !_nicknameField.hasError &&
        !_emailField.hasError;
  }

  @override
  void dispose() {
    _usernameField.dispose();
    _nicknameField.dispose();
    _emailField.dispose();
    _passwordField.dispose();
  }
}
