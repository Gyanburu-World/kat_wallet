import 'package:flutter/material.dart';

import '../../../../../core/abstractions/field.interface.dart';
import '../../../../../core/builders/field_validator.builder.dart';
import '../../../../../core/inject.dart';
import '../../../../../core/models/react_field.model.dart';
import '../../../presentation/sign_up/sign_up.controller.dart';
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
  return SignUpController(
    userNameField: _makeUserNameField(),
    emailField: _makeEmailField(),
    nameField: _makeNameField(),
    passwordField: _makePasswordField(),
    loading: Inject.find(),
  );
}

IField<String> _makeUserNameField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
    controller: TextEditingController(),
  );
}

IField<String> _makeNameField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
    controller: TextEditingController(),
  );
}

IField<String> _makeEmailField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().email().build(),
    controller: TextEditingController(),
  );
}

IField<String> _makePasswordField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().password().build(),
    controller: TextEditingController(),
  );
}
