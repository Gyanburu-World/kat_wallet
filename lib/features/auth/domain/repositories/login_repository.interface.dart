import '../models/user.model.dart';

abstract class ILoginRepository {
  Future<({UserModel user, String token})> authenticateUser({
    required String login,
    required String password,
  });

  Future<void> saveToken(String token);

  Future<void> saveUser(UserModel user);

  Future<bool> isUserLoggedIn();
}
