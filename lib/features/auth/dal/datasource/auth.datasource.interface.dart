import '../dto/authenticate_user.response.dart';

abstract class IAuthDatasource {
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String login,
    required String password,
  });
}
