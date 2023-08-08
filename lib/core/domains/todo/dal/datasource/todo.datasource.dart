import 'package:project_quest/core/domains/todo/dal/dto/create_todo.body.dart';
import 'package:project_quest/core/domains/todo/dal/dto/get_todo_by_id.response.dart';
import 'package:project_quest/core/domains/todo/dal/dto/update_todo.response.dart';
import 'package:project_quest/core/domains/todo/exceptions/create_todo_fail.exception.dart';
import 'package:project_quest/core/domains/todo/exceptions/fail_to_edit_todo.exception.dart';

import '../../../../base/abstractions/http_connect.interface.dart';
import '../../../../base/exceptions/http_failure.exception.dart';
import '../../exceptions/fail_to_delete_todo.exception.dart';
import '../data/todo.data.dart';
import '../dto/create_todo.response.dart';
import '../dto/delete_todo.response.dart';
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
      await _connect.post(
        'todos',
        body.toJson(),
        decoder: CreateTodoResponse.fromJson,
      );
    } on HttpFailureException<CreateTodoResponse> catch (err) {
      final error = err.object.errors!.first;
      throw FailToCreateTodoException(failure: error);
    }
  }

  @override
  Future<void> delete(TodoData data) async {
    try {
      await _connect.delete(
        'todos/${data.id}',
        decoder: DeleteTodoResponse.fromJson,
      );
    } on HttpFailureException<DeleteTodoResponse> catch (err) {
      final error = err.object.errors!.first;
      throw FailToDeleteTodoException(failure: error);
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
    } on HttpFailureException catch (_) {
      rethrow;
    }
  }

  @override
  Future<TodoData> update(TodoData data) async {
    try {
      final response = await _connect.put(
        'todos/${data.id}',
        data.toJson(),
        decoder: UpdateTodoResponse.fromJson,
      );

      return response.payload!.data!;
    } on HttpFailureException<UpdateTodoResponse> catch (err) {
      final error = err.object.errors!.first;
      throw FailToEditTodoException(failure: error);
    }
  }
}
