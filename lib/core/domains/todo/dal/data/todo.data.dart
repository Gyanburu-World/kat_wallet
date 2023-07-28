import 'package:json_annotation/json_annotation.dart';

part 'todo.data.g.dart';

@JsonSerializable()
class TodoData {
  final String id;
  final String title;
  final double? value;
  final DateTime date;
  final bool isBilling;

  TodoData({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.isBilling,
  });

  factory TodoData.fromJson(Map<String, dynamic> json) =>
      _$TodoDataFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDataToJson(this);
}
