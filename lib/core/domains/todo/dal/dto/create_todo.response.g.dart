// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoResponse _$CreateTodoResponseFromJson(Map<String, dynamic> json) =>
    CreateTodoResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateTodoResponseToJson(CreateTodoResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
