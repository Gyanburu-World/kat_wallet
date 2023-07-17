import '../../../../core/abstractions/field.interface.dart';
import '../../../shared/loading/loading.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';

class SignUpController implements ISignUpController {
  final ILoadingController loading;
  final IField<String> _userNameField;
  final IField<String> _nameField;
  final IField<String> _emailField;
  final IField<String> _passwordField;

  @override
  IField<String> get userNameField => _userNameField;

  @override
  IField<String> get nameField => _nameField;

  @override
  IField<String> get emailField => _emailField;

  @override
  IField<String> get passwordField => _passwordField;

  @override
  SignUpController({
    required IField<String> userNameField,
    required IField<String> nameField,
    required IField<String> emailField,
    required IField<String> passwordField,
    required this.loading,
  })  : _userNameField = userNameField,
        _nameField = nameField,
        _emailField = emailField,
        _passwordField = passwordField;

  @override
  void signUp() {
    try {
      loading.isLoading = true;
      if (validateFields) {
        // TODO: SIGN UP
      }
    } catch (err) {
      rethrow;
    } finally {
      loading.isLoading = false;
    }
  }

  bool get validateFields {
    _userNameField.validate();
    _nameField.validate();
    _emailField.validate();
    _passwordField.validate();

    return !_userNameField.hasError &&
        !_passwordField.hasError &&
        !_nameField.hasError &&
        !_emailField.hasError;
  }

  @override
  void dispose() {
    _userNameField.dispose();
    _nameField.dispose();
    _emailField.dispose();
    _passwordField.dispose();
  }
}
