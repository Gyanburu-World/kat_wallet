import 'package:project_quest/features/auth/domain/models/user.model.dart';
import 'package:project_quest/features/auth/domain/repositories/login_repository.interface.dart';

class AuthenticateUserUsecase {
  final ILoginRepository loginRepository;
  const AuthenticateUserUsecase({required this.loginRepository});

  Future<UserModel> call({required String login, required String password}) {
    final user = loginRepository.authenticateUser(
      login: login,
      password: password,
    );

    return user;
  }
}
