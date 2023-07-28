import '../../../../core/domains/user/domain/user_repository.interface.dart';

class SignUpUsecase {
  final IUserRepository signUpRepository;
  const SignUpUsecase({required this.signUpRepository});

  Future<void> call({
    required String email,
    required String password,
  }) async {
    try {
      await signUpRepository.signUp(password: password, email: email);
    } catch (err) {
      rethrow;
    }
  }
}
