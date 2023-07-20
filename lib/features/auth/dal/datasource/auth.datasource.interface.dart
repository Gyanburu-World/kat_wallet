import '../dto/authenticate_user.response.dart';

abstract class IAuthDatasource {
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String login,
    required String password,
  });

  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    required String? centralUser,
    required bool isCentral,
    required bool isCashier,
    required bool isDeliveryman,
  });
}
