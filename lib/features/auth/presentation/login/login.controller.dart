import 'package:flutter/foundation.dart';

import '../../../../core/abstractions/field.interface.dart';
import '../../domain/abstractions/login_controller.interface.dart';

class LoginController implements ILoginController {
  final IField<String> _loginField;
  final IField<String> _passwordField;

  @override
  IField<String> get loginField => _loginField;

  @override
  IField<String> get passwordField => _passwordField;

  LoginController({
    required IField<String> loginField,
    required IField<String> passwordField,
  })  : _loginField = loginField,
        _passwordField = passwordField;

  @override
  void doLogin() {
    if (validateFields) {
      debugPrint('success login');
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
