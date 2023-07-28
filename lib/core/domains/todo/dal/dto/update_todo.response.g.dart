// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_todo.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTodoResponse _$UpdateTodoResponseFromJson(Map<String, dynamic> json) =>
    UpdateTodoResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'] == null
          ? null
          : TodoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTodoResponseToJson(UpdateTodoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };
