import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';

import '../../../../core/dal/storage/storage.interface.dart';
import '../../domain/repositories/sign_up_repository.interface.dart';

class SignUpRepository implements ISignUpRepository {
  final IAuthDatasource authDatasource;
  final IStorage storage;
  const SignUpRepository({required this.authDatasource, required this.storage});

  @override
  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    required String nickname,
  }) async {
    try {
      await authDatasource.signUp(
        username: username,
        password: password,
        email: email,
        nickname: nickname,
      );
    } catch (err) {
      rethrow;
    }
  }
}
