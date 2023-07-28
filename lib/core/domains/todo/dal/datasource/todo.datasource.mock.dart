import 'dart:convert';

import '../../../../base/utils/mock.util.dart';
import '../dto/get_todos.response.dart';
import 'todo.datasource.interface.dart';
import 'todo_path_mocks.constants.dart';

class TodoDatasourceMock implements ITodoDatasource {
  @override
  Future<GetTodosResponse> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    final file = await MockUtil.getMockFile(TodoPathMocksConstants.getTodos);
    final response = GetTodosResponse.fromJson(jsonDecode(file));
    return response;
  }
}