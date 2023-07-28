import 'package:json_annotation/json_annotation.dart';

part 'todo.data.g.dart';

@JsonSerializable()
class TodoData {
  final int id;
  final String title;
  final String description;
  final double? value;
  final DateTime doneAt;
  final DateTime doAt;
  final bool recurring;

  const TodoData({
    required this.id,
    required this.title,
    required this.value,
    required this.description,
    required this.doAt,
    required this.doneAt,
    required this.recurring,
  });

  factory TodoData.fromJson(Map<String, dynamic> json) =>
      _$TodoDataFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDataToJson(this);
}
