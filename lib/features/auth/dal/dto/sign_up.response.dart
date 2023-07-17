import 'package:json_annotation/json_annotation.dart';

import '../../../../core/dal/data/error.data.dart';

part 'sign_up.response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final ErrorData? error;
  const SignUpResponse({required this.error});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
