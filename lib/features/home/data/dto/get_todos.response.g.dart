// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_todos.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodosResponse _$GetTodosResponseFromJson(Map<String, dynamic> json) =>
    GetTodosResponse(
      error: json['error'] == null
          ? null
          : ErrorData.fromJson(json['error'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => TodoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTodosResponseToJson(GetTodosResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
