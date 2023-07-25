import 'package:project_quest/features/home/data/mappers/todo.mapper.dart';
import 'package:project_quest/features/home/domain/models/todo.model.dart';

import '../../domain/repositories/todo_repository.interface.dart';
import '../datasource/todo.datasource.interface.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource todoDatasource;
  const TodoRepository({required this.todoDatasource});

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await todoDatasource.getTodos();
      final models = response.data.map((e) => TodoMapper.toModel(e)).toList();
      return models;
    } catch (err) {
      rethrow;
    }
  }
}
