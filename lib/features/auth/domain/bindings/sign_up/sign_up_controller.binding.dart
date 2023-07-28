import '../../../../../core/base/abstractions/field.interface.dart';
import '../../../../../core/base/builders/field_validator.builder.dart';
import '../../../../../core/base/dal/storage/storage.interface.dart';
import '../../../../../core/base/models/text_react_field.model.dart';
import '../../../../../core/domains/user/dal/datasource/user.datasource.interface.dart';
import '../../../../../core/domains/user/dal/user.repository.dart';
import '../../../../../core/inject.dart';
import '../../../presentation/sign_up/sign_up.controller.dart';
import '../../usecases/sign_up.usecase.dart';
import 'sign_up_controller.interface.dart';

class SignUpControllerBinding {
  static void inject() {
    Inject.injectController<ISignUpController>(makeSignUpController);
  }

  static void dipose() {
    Inject.disposeController<ISignUpController>();
  }
}

ISignUpController makeSignUpController() {
  final storage = Inject.find<IStorage>();
  final authDatasource = Inject.find<IUserDatasource>();

  final signUpRepository = UserRepository(
    userDatasource: authDatasource,
    storage: storage,
  );

  final signUpUsecase = SignUpUsecase(signUpRepository: signUpRepository);
  return SignUpController(
    emailField: _makeEmailField(),
    passwordField: _makePasswordField(),
    loading: Inject.find(),
    signUpUsecase: signUpUsecase,
  );
}

IField<String> _makeEmailField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().email().build(),
  );
}

IField<String> _makePasswordField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().password().build(),
  );
}
