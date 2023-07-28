// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_todo_by_id.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodoByIdResponse _$GetTodoByIdResponseFromJson(Map<String, dynamic> json) =>
    GetTodoByIdResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'] == null
          ? null
          : TodoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTodoByIdResponseToJson(
        GetTodoByIdResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };
