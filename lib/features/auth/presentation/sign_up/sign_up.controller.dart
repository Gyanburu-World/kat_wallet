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
  final IField<String> _emailField;
  final IField<String> _passwordField;
  final IField<bool> _centralCheckField;
  final IField<bool> _cashierCheckField;
  final IField<bool> _deliverymanCheckField;
  final IField<String> _centralField;

  @override
  IField<String> get userNameField => _usernameField;

  @override
  IField<String> get emailField => _emailField;

  @override
  IField<String> get passwordField => _passwordField;

  @override
  IField<bool> get centralCheckField => _centralCheckField;

  @override
  IField<bool> get cashierCheckField => _cashierCheckField;

  @override
  IField<bool> get deliverymanCheckField => _deliverymanCheckField;

  @override
  IField<String> get centralField => _centralField;

  @override
  SignUpController({
    required IField<String> usernameField,
    required IField<String> nicknameField,
    required IField<String> emailField,
    required IField<String> passwordField,
    required IField<bool> cashierCheckField,
    required IField<bool> centralCheckField,
    required IField<bool> deliverymanCheckField,
    required IField<String> centralField,
    required this.loading,
    required this.signUpUsecase,
  })  : _usernameField = usernameField,
        _emailField = emailField,
        _passwordField = passwordField,
        _centralCheckField = centralCheckField,
        _cashierCheckField = cashierCheckField,
        _deliverymanCheckField = deliverymanCheckField,
        _centralField = centralField {
    initCheckboxesCallbacks();
  }

  void initCheckboxesCallbacks() {
    _centralCheckField.onChangeCallback = (val) {
      if (val!) {
        _cashierCheckField.value = false;
        _deliverymanCheckField.value = false;
        _centralField.clearError();
      } else {
        if (!_cashierCheckField.value! && !_deliverymanCheckField.value!) {
          _centralCheckField.value = true;
        }
      }
    };
    _cashierCheckField.onChangeCallback = (val) {
      if (val!) {
        _centralCheckField.value = false;
        _deliverymanCheckField.value = false;
      } else {
        if (!_centralCheckField.value! && !_deliverymanCheckField.value!) {
          _cashierCheckField.value = true;
        }
      }
    };
    _deliverymanCheckField.onChangeCallback = (val) {
      if (val!) {
        _centralCheckField.value = false;
        _cashierCheckField.value = false;
      } else {
        if (!_cashierCheckField.value! && !!!_centralCheckField.value!) {
          _deliverymanCheckField.value = true;
        }
      }
    };
  }

  @override
  Future<void> signUp() async {
    try {
      loading.isLoading = true;
      if (validateFields) {
        await signUpUsecase(
          email: emailField.value!,
          password: passwordField.value!,
          username: userNameField.value!,
          isCashier: _cashierCheckField.value!,
          isCentral: _centralCheckField.value!,
          isDeliveryman: _deliverymanCheckField.value!,
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
    _emailField.validate();
    _passwordField.validate();

    if (_cashierCheckField.value! || _deliverymanCheckField.value!) {
      _centralField.validate();
    }

    return !_usernameField.hasError &&
        !_passwordField.hasError &&
        !_emailField.hasError &&
        !_centralField.hasError;
  }

  @override
  void dispose() {
    _usernameField.dispose();
    _emailField.dispose();
    _passwordField.dispose();
  }
}
