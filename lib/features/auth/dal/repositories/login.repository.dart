import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';
import 'package:project_quest/features/auth/domain/models/user.model.dart';

import '../../../../core/dal/storage/storage.interface.dart';
import '../../domain/constants/auth_storage.constants.dart';
import '../../domain/repositories/login_repository.interface.dart';
import '../mappers/user.mapper.dart';

class LoginRepository implements ILoginRepository {
  final IAuthDatasource authDatasource;
  final IStorage storage;
  const LoginRepository({required this.authDatasource, required this.storage});

  @override
  Future<UserModel> authenticateUser({
    required String login,
    required String password,
  }) async {
    try {
      final response = await authDatasource.authenticateUser(
        login: login,
        password: password,
      );

      await storage.write(
        key: AuthStorageConstants.tokenAuthorization,
        value: response.token,
      );

      final model = UserMapper.toModel(response.user);
      return model;
    } catch (err) {
      rethrow;
    }
  }
}
