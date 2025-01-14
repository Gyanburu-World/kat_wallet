import '../../../../core/base/abstractions/field.interface.dart';
import '../../../../core/domains/user/domain/exceptions/email_already_in_use.exception.dart';
import '../../shared/loading/loading.interface.dart';
import '../binding/sign_up_controller.interface.dart';
import '../usecases/sign_up.usecase.dart';

class SignUpController implements ISignUpController {
  final ILoadingController loading;
  final SignUpUsecase signUpUsecase;

  final IField<String> _emailField;
  final IField<String> _passwordField;

  @override
  IField<String> get emailField => _emailField;

  @override
  IField<String> get passwordField => _passwordField;

  @override
  SignUpController({
    required IField<String> emailField,
    required IField<String> passwordField,
    required this.loading,
    required this.signUpUsecase,
  })  : _emailField = emailField,
        _passwordField = passwordField;

  @override
  Future<void> signUp() async {
    try {
      loading.isLoading = true;
      if (validateFields) {
        await signUpUsecase(
          email: emailField.valueNotifier.value!,
          password: passwordField.valueNotifier.value!,
        );
      }
    } on EmailAlreadyInUseException catch (err) {
      _emailField.setError(err.failure.message);
      rethrow;
    } finally {
      loading.isLoading = false;
    }
  }

  bool get validateFields {
    _emailField.validate();
    _passwordField.validate();

    return !_passwordField.hasError && !_emailField.hasError;
  }

  @override
  void dispose() {
    _emailField.dispose();
    _passwordField.dispose();
  }
}
