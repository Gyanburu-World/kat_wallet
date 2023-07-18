import 'package:project_quest/features/auth/domain/repositories/login_repository.interface.dart';

class AuthenticateUserUsecase {
  final ILoginRepository loginRepository;
  const AuthenticateUserUsecase({required this.loginRepository});

  Future<void> call({
    required String login,
    required String password,
  }) async {
    try {
      final response = await loginRepository.authenticateUser(
        login: login,
        password: password,
      );

      await loginRepository.saveToken(response.token);
      await loginRepository.saveUser(response.user);
    } catch (err) {
      rethrow;
    }
  }
}
