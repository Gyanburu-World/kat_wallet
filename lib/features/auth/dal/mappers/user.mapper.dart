import '../../domain/enums/role.enum.dart';
import '../../domain/models/user.model.dart';
import '../data/user.data.dart';

abstract class UserMapper {
  static UserModel toModel(UserData data) {
    late final RoleEnum role;
    switch (data.role) {
      case 'major':
        role = RoleEnum.major;
      case 'relative':
        role = RoleEnum.relative;
      default:
        throw ArgumentError('Failed to convert', 'role');
    }

    return UserModel(id: data.id, name: data.name, role: role);
  }

  static Map<String, dynamic> toJson(UserModel model) {
    return {
      'id': model.id,
      'name': model.name,
      'role': model.role.toString(),
    };
  }
}
