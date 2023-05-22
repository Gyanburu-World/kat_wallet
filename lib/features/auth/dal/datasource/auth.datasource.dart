import 'package:project_quest/features/auth/dal/dto/authenticate_user.response.dart';

import 'auth.datasource.interface.dart';

class AuthDatasource implements IAuthDatasource {
  @override
  AuthenticateUserDataResponse authenticateUser({
    required String login,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
