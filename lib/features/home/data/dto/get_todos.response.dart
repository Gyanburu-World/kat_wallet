import 'package:json_annotation/json_annotation.dart';
import 'package:project_quest/features/home/data/data/todo.data.dart';

import '../../../../core/dal/data/error.data.dart';

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
