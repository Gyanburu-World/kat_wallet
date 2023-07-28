import '../data/todo.data.dart';
import '../dto/create_todo.body.dart';

abstract class ITodoDatasource {
  Future<List<TodoData>> fetch();
  Future<void> create(CreateTodoBody body);
}
