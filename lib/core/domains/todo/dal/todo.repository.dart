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
      final models = response.map((e) => TodoMapper.toModel(e)).toList();
      return models;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> create({
    required String title,
    required String? description,
    required double? value,
    required DateTime doAt,
    required bool isRecurring,
    required bool isBilling,
  }) async {
    final body = CreateTodoBody(
      title: title,
      description: description,
      value: value,
      doAt: doAt,
      recurring: isRecurring,
      pay: !isBilling,
    );

    await todoDatasource.create(body);
  }

  @override
  Future<void> delete(TodoModel model) async {
    final data = TodoMapper.toData(model);
    await todoDatasource.delete(data);
  }

  @override
  Future<TodoModel> getById(int id) async {
    final response = await todoDatasource.getById(id);
    final model = TodoMapper.toModel(response);
    return model;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    final data = TodoMapper.toData(model);
    final response = await todoDatasource.update(data);
    final responseModel = TodoMapper.toModel(response);
    return responseModel;
  }
}
