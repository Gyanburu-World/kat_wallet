import '../dto/get_todos.response.dart';
import 'todo.datasource.interface.dart';

class TodoDatasource implements ITodoDatasource {
  @override
  Future<GetTodosResponse> getTodos() {
    throw UnimplementedError();
  }
}
