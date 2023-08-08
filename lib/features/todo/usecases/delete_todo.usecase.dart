import '../../../../core/domains/todo/domain/models/todo.model.dart';
import '../../../../core/domains/todo/domain/todo_repository.interface.dart';

class DeleteTodoUsecase {
  final ITodoRepository todoRepository;
  const DeleteTodoUsecase({required this.todoRepository});

  Future<void> call(TodoModel todo) async {
    try {
      await todoRepository.delete(todo);
    } catch (err) {
      rethrow;
    }
  }
}
