import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../../../core/domains/todo/domain/todo_repository.interface.dart';

class EditTodoUsecase {
  final ITodoRepository todoRepository;
  const EditTodoUsecase({required this.todoRepository});

  Future<void> call({
    required int id,
    required String title,
    required String? description,
    required double? value,
    required DateTime doAt,
    required bool isRecurring,
    required bool isBilling,
  }) async {
    try {
      final todo = TodoModel(
        id: id,
        title: title,
        value: value,
        description: description,
        doAt: doAt,
        isRecurring: isRecurring,
        isBilling: isBilling,
      );

      await todoRepository.update(todo);
    } catch (err) {
      rethrow;
    }
  }
}
