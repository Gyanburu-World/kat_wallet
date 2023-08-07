import '../../../../../core/base/abstractions/controller.interface.dart';
import '../../../../../core/base/abstractions/field.interface.dart';

abstract class ISignUpController extends IController {
  IField<String> get emailField;
  IField<String> get passwordField;

  Future<void> signUp();
}
