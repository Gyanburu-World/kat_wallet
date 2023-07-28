import 'package:project_quest/core/domains/todo/dal/mappers/todo.mapper.dart';
import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../domain/todo_repository.interface.dart';
import 'datasource/todo.datasource.interface.dart';
import 'dto/create_todo.body.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource todoDatasource;
  const TodoRepository({required this.todoDatasource});

  @override
  Future<List<TodoModel>> fetch() async {
    try {
      final response = await todoDatasource.fetch();
      final models = response.data!.map((e) => TodoMapper.toModel(e)).toList();
      return models;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> create({
    required String title,
    required String? description,
    required int? value,
    required DateTime doAt,
    required bool recurring,
  }) async {
    final body = CreateTodoBody(
      title: title,
      description: description,
      value: value,
      doAt: doAt,
      recurring: recurring,
    );

    await todoDatasource.create(body);
  }
}
