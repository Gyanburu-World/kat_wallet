import '../data/todo.data.dart';
import '../dto/create_todo.body.dart';

abstract class ITodoDatasource {
  Future<List<TodoData>> fetch();
  Future<void> create(CreateTodoBody body);
  Future<TodoData> getById(int id);
  Future<TodoData> update(TodoData data);
  Future<void> delete(TodoData data);
}
