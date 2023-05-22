import 'package:json_annotation/json_annotation.dart';

part 'user.data.g.dart';

@JsonSerializable()
class UserData {
  final String id;
  final String name;
  final String role;

  UserData({
    required this.id,
    required this.name,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
