import 'package:project_quest/core/domains/todo/dal/todo.repository.dart';
import 'package:project_quest/features/todo/usecases/create_todo.usecase.dart';

import '../../../../core/inject.dart';
import '../../../core/base/abstractions/field.interface.dart';
import '../../../core/base/builders/field_validator.builder.dart';
import '../../../core/base/models/react_field.model.dart';
import '../../../core/base/models/text_react_field.model.dart';
import '../presentation/todo.controller.dart';
import 'todo_controller.interface.dart';

class TodoControllerBinding {
  static void inject() {
    Inject.injectController<ITodoController>(makeTodoController);
  }

  static void dipose() {
    Inject.disposeController<ITodoController>();
  }
}

ITodoController makeTodoController() {
  final todoRepository = TodoRepository(todoDatasource: Inject.find());
  final createTodoUsecase = CreateTodoUsecase(todoRepository: todoRepository);

  return TodoController(
    loading: Inject.find(),
    createTodoUsecase: createTodoUsecase,
    titleField: makeTitleField(),
    descriptionField: makeDescriptionField(),
    valueField: makeValueField(),
    isBillingField: makeIsBillingField(),
    isRecurringField: makeIsRecurringField(),
    doAtField: makeDoAtField(),
  );
}

IField<String> makeTitleField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}

IField<String> makeDescriptionField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().build(),
  );
}

IField<double> makeValueField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<double>().build(),
  );
}

IField<bool> makeIsBillingField() {
  return ReactFieldModel(
    value: true,
    validators: FieldValidatorBuilder<bool>().build(),
  );
}

IField<bool> makeIsRecurringField() {
  return ReactFieldModel(
    value: false,
    validators: FieldValidatorBuilder<bool>().build(),
  );
}

IField<DateTime> makeDoAtField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<DateTime>().required().build(),
  );
}
