import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';
import 'package:project_quest/features/auth/domain/models/user.model.dart';

import '../../../../core/dal/storage/storage.interface.dart';
import '../../domain/constants/auth_storage.constants.dart';
import '../../domain/repositories/login_repository.interface.dart';
import '../dto/authenticate_user.body.dart';
import '../mappers/user.mapper.dart';

class LoginRepository implements ILoginRepository {
  final IAuthDatasource authDatasource;
  final IStorage storage;
  const LoginRepository({required this.authDatasource, required this.storage});

  @override
  Future<({UserModel user, String token})> authenticateUser({
    required String login,
    required String password,
  }) async {
    final body = AuthenticateUserBody(email: login, password: password);
    final response = await authDatasource.authenticateUser(body);
    final model = UserMapper.toModel(response.user);
    return (user: model, token: response.token);
  }

  @override
  Future<void> saveToken(String token) async {
    await storage.write(
      key: AuthStorageConstants.tokenAuthorization,
      value: token,
    );
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final json = UserMapper.toJson(user);
    await storage.write(key: AuthStorageConstants.user, value: json);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    final user = await storage.read(AuthStorageConstants.user);
    final token = await storage.read(AuthStorageConstants.tokenAuthorization);

    return token != null && user != null;
  }
}
