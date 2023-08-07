import 'package:json_annotation/json_annotation.dart';

import '../../../../base/dal/data/error.data.dart';

part 'delete_todo.response.g.dart';

@JsonSerializable()
class DeleteTodoResponse {
  final List<ErrorData>? errors;
  const DeleteTodoResponse({required this.errors});

  factory DeleteTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTodoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTodoResponseToJson(this);
}
