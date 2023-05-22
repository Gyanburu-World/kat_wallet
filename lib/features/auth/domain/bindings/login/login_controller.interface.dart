import '../../../../../core/abstractions/controller.interface.dart';
import '../../../../../core/abstractions/field.interface.dart';

abstract class ILoginController extends IController {
  IField<String> get loginField;
  IField<String> get passwordField;

  Future<void> authenticateUser();
}
