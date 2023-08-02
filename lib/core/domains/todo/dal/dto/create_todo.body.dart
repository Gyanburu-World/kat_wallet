import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_todo.body.g.dart';

@JsonSerializable()
class CreateTodoBody extends Equatable {
  final String title;
  final String? description;
  final double? value;
  final bool recurring;
  final bool pay;

  @JsonKey(name: 'do_at')
  final DateTime doAt;

  const CreateTodoBody({
    required this.description,
    required this.doAt,
    required this.recurring,
    required this.title,
    required this.value,
    required this.pay,
  });

  factory CreateTodoBody.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTodoBodyToJson(this);

  @override
  List<Object?> get props => [title, description, value, doAt, recurring];
}
