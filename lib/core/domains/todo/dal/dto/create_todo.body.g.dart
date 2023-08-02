// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoBody _$CreateTodoBodyFromJson(Map<String, dynamic> json) =>
    CreateTodoBody(
      description: json['description'] as String?,
      doAt: DateTime.parse(json['do_at'] as String),
      recurring: json['recurring'] as bool,
      title: json['title'] as String,
      value: (json['value'] as num?)?.toDouble(),
      pay: json['pay'] as bool,
    );

Map<String, dynamic> _$CreateTodoBodyToJson(CreateTodoBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
      'recurring': instance.recurring,
      'pay': instance.pay,
      'do_at': instance.doAt.toIso8601String(),
    };
