import 'package:flutter/cupertino.dart';
import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';
import 'package:project_quest/features/auth/dal/repositories/login.repository.dart';
import 'package:project_quest/features/auth/domain/usecases/authenticate_user.usecase.dart';

import '../../../../../core/abstractions/field.interface.dart';
import '../../../../../core/builders/field_validator.builder.dart';
import '../../../../../core/dal/storage/storage.interface.dart';
import '../../../../../core/inject.dart';
import '../../../../../core/models/react_field.model.dart';
import '../../../presentation/login/login.controller.dart';
import 'login_controller.interface.dart';

class LoginControllerBinding {
  static void inject() {
    Inject.injectController<ILoginController>(makeLoginController);
  }

  static void dipose() {
    Inject.disposeController<ILoginController>();
  }
}

ILoginController makeLoginController() {
  final storage = Inject.find<IStorage>();
  final authDatasource = Inject.find<IAuthDatasource>();

  final loginRepository = LoginRepository(
    storage: storage,
    authDatasource: authDatasource,
  );

  final authenticateUserUsecase = AuthenticateUserUsecase(
    loginRepository: loginRepository,
  );

  return LoginController(
    loginField: makeLoginField(),
    passwordField: makePasswordField(),
    authenticateUserUsecase: authenticateUserUsecase,
  );
}

IField<String> makeLoginField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
    controller: TextEditingController(),
  );
}

IField<String> makePasswordField() {
  return ReactFieldModel(
    validateOnType: false,
    validators: FieldValidatorBuilder<String>().required().password().build(),
    controller: TextEditingController(),
  );
}
