import '../dto/authenticate_user.response.dart';
import 'auth.datasource.interface.dart';

class AuthDatasource implements IAuthDatasource {
  @override
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String login,
    required String password,
  }) async {
    throw UnimplementedError();
  }
}
