import '../../../../core/inject.dart';
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
  return TodoController();
}
