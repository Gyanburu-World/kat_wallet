import '../../../../core/abstractions/field.interface.dart';
import '../../../../core/builders/field_validator.builder.dart';
import '../../../../core/domains/user/dal/user.repository.dart';
import '../../../../core/inject.dart';
import '../../../../core/models/text_react_field.model.dart';
import '../../data/repositories/todo.repository.dart';
import '../../presentation/home.controller.dart';
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

  return HomeController(
    loading: Inject.find(),
    getTodosUsecase: getTodosUsecase,
    logoutUsecase: logoutUsecase,
  );
}

IField<String> makeNameField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}
