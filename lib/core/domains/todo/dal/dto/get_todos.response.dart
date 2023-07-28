import 'package:json_annotation/json_annotation.dart';
import 'package:project_quest/core/domains/todo/dal/data/todo.data.dart';

import '../../../../base/dal/data/error.data.dart';

part 'get_todos.response.g.dart';

@JsonSerializable()
class GetTodosResponse {
  final List<TodoData> data;
  final List<ErrorData>? errors;
  const GetTodosResponse({required this.errors, required this.data});

  factory GetTodosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTodosResponseToJson(this);
}
