import 'package:project_quest/features/home/usecases/delete_todo.usecase.dart';

import '../../../../core/base/abstractions/field.interface.dart';
import '../../../../core/base/builders/field_validator.builder.dart';
import '../../../../core/base/models/text_react_field.model.dart';
import '../../../../core/domains/user/dal/user.repository.dart';
import '../../../../core/inject.dart';
import '../../../../core/domains/todo/dal/todo.repository.dart';
import '../presentation/home.controller.dart';
import '../usecases/get_todos.usecase.dart';
import '../usecases/logout.usecase.dart';
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
  final userRepository = UserRepository(
    userDatasource: Inject.find(),
    storage: Inject.find(),
  );

  final logoutUsecase = LogoutUsecase(userRepository: userRepository);
  final getTodosUsecase = GetTodosUsecase(todoRepository: todoRepository);
  final deleteTodoUsecase = DeleteTodoUsecase(todoRepository: todoRepository);

  return HomeController(
    loading: Inject.find(),
    getTodosUsecase: getTodosUsecase,
    logoutUsecase: logoutUsecase,
    deleteTodoUsecase: deleteTodoUsecase,
  );
}

IField<String> makeNameField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}
