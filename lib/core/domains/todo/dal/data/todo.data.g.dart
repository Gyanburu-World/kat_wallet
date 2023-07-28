// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoData _$TodoDataFromJson(Map<String, dynamic> json) => TodoData(
      id: json['id'] as int,
      title: json['title'] as String,
      value: (json['value'] as num?)?.toDouble(),
      description: json['description'] as String,
      doAt: DateTime.parse(json['doAt'] as String),
      doneAt: DateTime.parse(json['doneAt'] as String),
      recurring: json['recurring'] as bool,
    );

Map<String, dynamic> _$TodoDataToJson(TodoData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
      'doneAt': instance.doneAt.toIso8601String(),
      'doAt': instance.doAt.toIso8601String(),
      'recurring': instance.recurring,
    };
