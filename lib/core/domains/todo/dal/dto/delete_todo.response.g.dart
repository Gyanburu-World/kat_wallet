// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_todo.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteTodoResponse _$DeleteTodoResponseFromJson(Map<String, dynamic> json) =>
    DeleteTodoResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeleteTodoResponseToJson(DeleteTodoResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
