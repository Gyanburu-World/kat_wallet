import 'package:project_quest/core/domains/todo/dal/dto/create_todo.body.dart';

import '../dto/get_todos.response.dart';
import 'todo.datasource.interface.dart';

class TodoDatasource implements ITodoDatasource {
  @override
  Future<GetTodosResponse> fetch() {
    throw UnimplementedError();
  }

  @override
  Future<void> create(CreateTodoBody body) {
    throw UnimplementedError();
  }
}
