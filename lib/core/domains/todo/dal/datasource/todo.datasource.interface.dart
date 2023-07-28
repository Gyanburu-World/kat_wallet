import '../dto/get_todos.response.dart';

abstract class ITodoDatasource {
  Future<GetTodosResponse> fetch();
}
