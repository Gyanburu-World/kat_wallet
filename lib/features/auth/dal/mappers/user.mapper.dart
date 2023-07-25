import '../../domain/models/user.model.dart';
import '../data/user.data.dart';

abstract class UserMapper {
  static UserModel toModel(UserData data) {
    return UserModel(id: data.id, name: data.name);
  }

  static Map<String, dynamic> toJson(UserModel model) {
    return {'id': model.id, 'name': model.name};
  }
}
