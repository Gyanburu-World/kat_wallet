// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoData _$TodoDataFromJson(Map<String, dynamic> json) => TodoData(
      id: json['id'] as String,
      title: json['title'] as String,
      value: (json['value'] as num?)?.toDouble(),
      date: DateTime.parse(json['date'] as String),
      isBilling: json['isBilling'] as bool,
    );

Map<String, dynamic> _$TodoDataToJson(TodoData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
      'isBilling': instance.isBilling,
    };
