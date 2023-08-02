import 'models/todo.model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> fetch();

  Future<void> create({
    required String title,
    required String? description,
    required double? value,
    required DateTime doAt,
    required bool isRecurring,
    required bool isBilling,
  });

  Future<TodoModel> getById(int id);
  Future<TodoModel> update(TodoModel data);
  Future<void> delete(TodoModel data);
}
