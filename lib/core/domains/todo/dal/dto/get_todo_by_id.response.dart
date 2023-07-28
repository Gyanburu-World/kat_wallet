import 'package:json_annotation/json_annotation.dart';
import 'package:project_quest/core/domains/todo/dal/data/todo.data.dart';

import '../../../../base/dal/data/error.data.dart';

part 'get_todo_by_id.response.g.dart';

@JsonSerializable()
class GetTodoByIdResponse {
  final TodoData? data;
  final List<ErrorData>? errors;
  const GetTodoByIdResponse({required this.errors, required this.data});

  factory GetTodoByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodoByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTodoByIdResponseToJson(this);
}
