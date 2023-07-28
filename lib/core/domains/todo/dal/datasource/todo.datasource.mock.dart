import 'dart:convert';

import 'package:project_quest/core/domains/todo/dal/dto/create_todo.body.dart';

import '../../../../base/utils/mock.util.dart';
import '../data/todo.data.dart';
import '../dto/get_todos.response.dart';
import 'todo.datasource.interface.dart';
import 'todo_path_mocks.constants.dart';

class TodoDatasourceMock implements ITodoDatasource {
  @override
  Future<List<TodoData>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    final file = await MockUtil.getMockFile(TodoPathMocksConstants.getTodos);
    final response = GetTodosResponse.fromJson(jsonDecode(file));
    return response.data!;
  }

  @override
  Future<void> create(CreateTodoBody body) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
