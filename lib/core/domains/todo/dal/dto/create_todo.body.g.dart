// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoBody _$CreateTodoBodyFromJson(Map<String, dynamic> json) =>
    CreateTodoBody(
      description: json['description'] as String?,
      doAt: DateTime.parse(json['doAt'] as String),
      recurring: json['recurring'] as bool,
      title: json['title'] as String,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$CreateTodoBodyToJson(CreateTodoBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
      'doAt': instance.doAt.toIso8601String(),
      'recurring': instance.recurring,
    };
