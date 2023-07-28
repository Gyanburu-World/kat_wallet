import 'package:json_annotation/json_annotation.dart';
import 'package:project_quest/core/domains/todo/dal/data/todo.data.dart';

import '../../../../base/dal/data/error.data.dart';

part 'update_todo.response.g.dart';

@JsonSerializable()
class UpdateTodoResponse {
  final TodoData? data;
  final List<ErrorData>? errors;
  const UpdateTodoResponse({required this.errors, required this.data});

  factory UpdateTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTodoResponseToJson(this);
}
