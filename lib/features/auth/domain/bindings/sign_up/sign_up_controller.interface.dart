import '../../../../../core/abstractions/controller.interface.dart';
import '../../../../../core/abstractions/field.interface.dart';

abstract class ISignUpController extends IController {
  IField<String> get userNameField;
  IField<String> get nameField;
  IField<String> get emailField;
  IField<String> get passwordField;

  void signUp();
}
