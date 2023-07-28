import 'package:project_quest/core/domains/todo/dal/dto/create_todo.body.dart';
import 'package:project_quest/core/domains/todo/dal/dto/get_todo_by_id.response.dart';

import '../../../../base/abstractions/http_connect.interface.dart';
import '../../../../base/exceptions/http_failure.exception.dart';
import '../data/todo.data.dart';
import '../dto/get_todos.response.dart';
import 'todo.datasource.interface.dart';

class TodoDatasource implements ITodoDatasource {
  final IHttpConnect _connect;
  const TodoDatasource({required IHttpConnect connect}) : _connect = connect;

  @override
  Future<List<TodoData>> fetch() async {
    try {
      final response = await _connect.get(
        'todos',
        decoder: GetTodosResponse.fromJson,
      );

      return response.payload!.data!;
    } on HttpFailureException<GetTodosResponse> catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> create(CreateTodoBody body) async {
    try {
      await _connect.post('todos', body.toJson());
    } on HttpFailureException<GetTodosResponse> catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(TodoData data) async {
    try {
      await _connect.delete('todos/${data.id}');
    } on HttpFailureException<GetTodosResponse> catch (_) {
      rethrow;
    }
  }

  @override
  Future<TodoData> getById(int id) async {
    try {
      final response = await _connect.get(
        'todos/$id',
        decoder: GetTodoByIdResponse.fromJson,
      );

      return response.payload!.data!;
    } on HttpFailureException<GetTodosResponse> catch (_) {
      rethrow;
    }
  }

  @override
  Future<TodoData> update(TodoData data) async {
    try {
      final response = await _connect.update(
        'todos/${data.id}',
        data.toJson(),
        decoder: GetTodoByIdResponse.fromJson,
      );

      return response.payload!.data!;
    } on HttpFailureException<GetTodosResponse> catch (_) {
      rethrow;
    }
  }
}
