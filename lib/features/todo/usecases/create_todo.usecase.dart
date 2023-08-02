import '../../../core/domains/todo/domain/todo_repository.interface.dart';

class CreateTodoUsecase {
  final ITodoRepository todoRepository;
  const CreateTodoUsecase({required this.todoRepository});

  Future<void> call({
    required String title,
    required String? description,
    required double? value,
    required DateTime doAt,
    required bool isRecurring,
    required bool isBilling,
  }) async {
    try {
      await todoRepository.create(
        description: description,
        doAt: doAt,
        isRecurring: isRecurring,
        isBilling: isBilling,
        title: title,
        value: value,
      );
    } catch (err) {
      rethrow;
    }
  }
}
