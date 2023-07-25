import 'package:project_quest/features/home/data/repositories/todo.repository.dart';
import 'package:project_quest/features/home/domain/usecases/get_todos.usecase.dart';

import '../../../../core/abstractions/field.interface.dart';
import '../../../../core/builders/field_validator.builder.dart';
import '../../../../core/inject.dart';
import '../../../../core/models/text_react_field.model.dart';
import '../../presentation/home.controller.dart';
import 'home_controller.interface.dart';

class HomeControllerBinding {
  static void inject() {
    Inject.injectController<IHomeController>(makeHomeController);
  }

  static void dipose() {
    Inject.disposeController<IHomeController>();
  }
}

IHomeController makeHomeController() {
  final todoRepository = TodoRepository(todoDatasource: Inject.find());
  final getTodosUsecase = GetTodosUsecase(todoRepository: todoRepository);
  return HomeController(getTodosUsecase: getTodosUsecase);
}

IField<String> makeNameField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}
