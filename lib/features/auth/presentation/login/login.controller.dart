import 'dart:developer' as developer;

import '../../../../core/abstractions/field.interface.dart';
import '../../domain/bindings/login/login_controller.interface.dart';
import '../../domain/usecases/authenticate_user.usecase.dart';

class LoginController implements ILoginController {
  final AuthenticateUserUsecase authenticateUserUsecase;
  final IField<String> _loginField;
  final IField<String> _passwordField;

  @override
  IField<String> get loginField => _loginField;

  @override
  IField<String> get passwordField => _passwordField;

  LoginController({
    required IField<String> loginField,
    required IField<String> passwordField,
    required this.authenticateUserUsecase,
  })  : _loginField = loginField,
        _passwordField = passwordField;

  @override
  void authenticateUser() async {
    if (validateFields) {
      final user = await authenticateUserUsecase(
        login: _loginField.value!,
        password: _passwordField.value!,
      );

      developer.log('$user');
    }
  }

  bool get validateFields {
    _loginField.validate();
    _passwordField.validate();

    return !_loginField.hasError && !_passwordField.hasError;
  }

  @override
  void dispose() {
    _loginField.dispose();
    _passwordField.dispose();
  }
}
