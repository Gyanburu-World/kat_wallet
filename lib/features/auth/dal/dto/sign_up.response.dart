import 'package:json_annotation/json_annotation.dart';
import 'package:project_quest/features/auth/dal/data/user.data.dart';

import '../../../../core/dal/data/error.data.dart';

part 'sign_up.response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final UserData data;
  final ErrorData? error;
  const SignUpResponse({required this.error, required this.data});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
