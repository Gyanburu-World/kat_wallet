import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up.body.g.dart';

@JsonSerializable()
class SignUpBody extends Equatable {
  final String username;
  final String password;
  final String email;
  final String nickname;

  const SignUpBody({
    required this.username,
    required this.password,
    required this.email,
    required this.nickname,
  });

  factory SignUpBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpBodyToJson(this);

  @override
  List<Object?> get props => [username, password, email, nickname];
}
