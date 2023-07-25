// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      error: json['error'] == null
          ? null
          : ErrorData.fromJson(json['error'] as Map<String, dynamic>),
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
