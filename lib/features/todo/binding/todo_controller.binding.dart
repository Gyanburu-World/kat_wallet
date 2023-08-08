import '../../../../core/inject.dart';
import '../../../core/base/abstractions/field.interface.dart';
import '../../../core/base/builders/field_validator.builder.dart';
import '../../../core/base/models/react_field.model.dart';
import '../../../core/base/models/text_react_field.model.dart';
import '../../../core/domains/todo/dal/todo.repository.dart';
import '../../../core/domains/todo/domain/models/todo.model.dart';
import '../presentation/todo.controller.dart';
import '../usecases/usecases.dart';
import 'todo_controller.interface.dart';

class TodoControllerBinding {
  static void inject(TodoModel? todo) {
    Inject.injectController<ITodoController>(() => makeTodoController(todo));
  }

  static void dipose() {
    Inject.disposeController<ITodoController>();
  }
}

ITodoController makeTodoController(TodoModel? todo) {
  final todoRepository = TodoRepository(todoDatasource: Inject.find());
  final createTodoUsecase = CreateTodoUsecase(todoRepository: todoRepository);
  final editTodoUsecase = EditTodoUsecase(todoRepository: todoRepository);
  final deleteTodoUsecase = DeleteTodoUsecase(todoRepository: todoRepository);

  return TodoController(
    todoForUpdate: todo,
    loading: Inject.find(),
    createTodoUsecase: createTodoUsecase,
    editTodoUsecase: editTodoUsecase,
    deleteTodoUsecase: deleteTodoUsecase,
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
