import 'models/todo.model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> fetch();
}
