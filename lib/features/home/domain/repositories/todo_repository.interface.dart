import 'package:project_quest/features/home/domain/models/todo.model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> getTodos();
}
