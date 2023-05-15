import 'package:flutter/cupertino.dart';

import '../../../../core/abstractions/field.interface.dart';
import '../../../../core/builders/field_validator.builder.dart';
import '../../../../core/inject.dart';
import '../../../../core/models/react_field.model.dart';
import '../../presentation/login/login.controller.dart';
import '../abstractions/login_controller.interface.dart';

class LoginControllerBinding {
  static void inject() {
    Inject.injectController<ILoginController>(makeLoginController);
  }

  static void dipose() {
    Inject.disposeController<ILoginController>();
  }
}

ILoginController makeLoginController() => LoginController(
      loginField: makeLoginField(),
      passwordField: makePasswordField(),
    );

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
