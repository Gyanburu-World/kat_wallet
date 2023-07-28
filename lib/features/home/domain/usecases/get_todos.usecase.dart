import '../../../../core/domains/todo/domain/models/todo.model.dart';
import '../../../../core/domains/todo/domain/todo_repository.interface.dart';

class GetTodosUsecase {
  final ITodoRepository todoRepository;
  const GetTodosUsecase({required this.todoRepository});

  Future<List<TodoModel>> call() async {
    try {
      return await todoRepository.fetch();
    } catch (err) {
      rethrow;
    }
  }
}
