// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpBody _$SignUpBodyFromJson(Map<String, dynamic> json) => SignUpBody(
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$SignUpBodyToJson(SignUpBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'nickname': instance.nickname,
    };
