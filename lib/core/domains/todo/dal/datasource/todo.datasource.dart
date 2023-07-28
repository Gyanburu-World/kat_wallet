import 'package:project_quest/core/domains/todo/dal/dto/create_todo.body.dart';

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
  Future<void> create(CreateTodoBody body) {
    throw UnimplementedError();
  }
}
