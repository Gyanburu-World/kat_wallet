import '../dto/authenticate_user.response.dart';

abstract class IAuthDatasource {
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String email,
    required String password,
  });

  Future<void> signUp({required String email, required String password});
}
