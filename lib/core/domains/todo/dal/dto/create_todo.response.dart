import 'package:json_annotation/json_annotation.dart';

import '../../../../base/dal/data/error.data.dart';

part 'create_todo.response.g.dart';

@JsonSerializable()
class CreateTodoResponse {
  final List<ErrorData>? errors;
  const CreateTodoResponse({required this.errors});

  factory CreateTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTodoResponseToJson(this);
}
