import '../enums/role.enum.dart';

class UserModel {
  final String id;
  final String name;
  final RoleEnum role;

  const UserModel({required this.id, required this.name, required this.role});

  @override
  String toString() => 'UserModel [id: $id, name: $name, role: $role]';
}
