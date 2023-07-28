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
      doAt: DateTime.parse(json['do_at'] as String),
      doneAt: json['done_at'] == null
          ? null
          : DateTime.parse(json['done_at'] as String),
      recurring: json['recurring'] as bool,
      pay: json['pay'] as bool,
    );

Map<String, dynamic> _$TodoDataToJson(TodoData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
      'recurring': instance.recurring,
      'pay': instance.pay,
      'do_at': instance.doAt.toIso8601String(),
      'done_at': instance.doneAt?.toIso8601String(),
    };
