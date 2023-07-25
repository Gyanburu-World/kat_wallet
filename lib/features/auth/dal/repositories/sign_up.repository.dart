import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';

import '../../../../core/dal/storage/storage.interface.dart';
import '../../domain/repositories/sign_up_repository.interface.dart';
import '../dto/sign_up.body.dart';

class SignUpRepository implements ISignUpRepository {
  final IAuthDatasource authDatasource;
  final IStorage storage;
  const SignUpRepository({required this.authDatasource, required this.storage});

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      final body = SignUpBody(email: email, password: password);
      await authDatasource.signUp(body);
    } catch (err) {
      rethrow;
    }
  }
}
