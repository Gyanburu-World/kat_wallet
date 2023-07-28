import '../dto/create_todo.body.dart';
import '../dto/get_todos.response.dart';

abstract class ITodoDatasource {
  Future<GetTodosResponse> fetch();
  Future<void> create(CreateTodoBody body);
}
