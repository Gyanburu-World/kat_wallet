import '../models/user.model.dart';

abstract class ILoginRepository {
  Future<UserModel> authenticateUser({
    required String login,
    required String password,
  });
}
