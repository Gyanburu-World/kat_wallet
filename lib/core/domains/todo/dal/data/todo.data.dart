import 'package:json_annotation/json_annotation.dart';

part 'todo.data.g.dart';

@JsonSerializable()
class TodoData {
  final int id;
  final String title;
  final String description;
  final double? value;
  final bool recurring;
  final bool pay;

  @JsonKey(name: 'do_at')
  final DateTime doAt;

  @JsonKey(name: 'done_at')
  final DateTime? doneAt;

  const TodoData({
    required this.id,
    required this.title,
    required this.value,
    required this.description,
    required this.doAt,
    required this.doneAt,
    required this.recurring,
    required this.pay,
  });

  factory TodoData.fromJson(Map<String, dynamic> json) =>
      _$TodoDataFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDataToJson(this);
}
