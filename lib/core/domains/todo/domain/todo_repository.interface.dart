import 'models/todo.model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> fetch();

// {
//   "title": "string",
//   "description": "string",
//   "value": 0,
//   "do_at": "2023-07-28",
//   "recurring": true
// }

  Future<void> create({
    required String title,
    required String? description,
    required int? value,
    required DateTime doAt,
    required bool recurring,
  });
}
