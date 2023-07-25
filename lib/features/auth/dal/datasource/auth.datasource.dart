import '../dto/authenticate_user.response.dart';
import 'auth.datasource.interface.dart';

class AuthDatasource implements IAuthDatasource {
  @override
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticateUserDataResponse> signUp({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
