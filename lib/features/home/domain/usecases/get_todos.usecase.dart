import 'package:project_quest/features/home/domain/models/todo.model.dart';

import '../repositories/todo_repository.interface.dart';

class GetTodosUsecase {
  final ITodoRepository todoRepository;
  const GetTodosUsecase({required this.todoRepository});

  Future<List<TodoModel>> call() async {
    try {
      return await todoRepository.getTodos();
    } catch (err) {
      rethrow;
    }
  }
}
