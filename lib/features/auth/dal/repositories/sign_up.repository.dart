import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';

import '../../../../core/dal/storage/storage.interface.dart';
import '../../domain/repositories/sign_up_repository.interface.dart';

class SignUpRepository implements ISignUpRepository {
  final IAuthDatasource authDatasource;
  final IStorage storage;
  const SignUpRepository({required this.authDatasource, required this.storage});

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await authDatasource.signUp(password: password, email: email);
    } catch (err) {
      rethrow;
    }
  }
}
