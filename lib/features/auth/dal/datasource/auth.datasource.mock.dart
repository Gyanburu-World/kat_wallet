import 'package:project_quest/features/auth/dal/data/user.data.dart';
import 'package:project_quest/features/auth/dal/dto/authenticate_user.response.dart';

import 'auth.datasource.interface.dart';

class AuthDatasourceMock implements IAuthDatasource {
  @override
  AuthenticateUserDataResponse authenticateUser({
    required String login,
    required String password,
  }) {
    return AuthenticateUserDataResponse(
      user: UserData(id: '123', name: 'Katekko', role: 'major'),
      token: 'tokenjwt',
    );
  }
}
