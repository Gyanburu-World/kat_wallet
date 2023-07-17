import '../repositories/sign_up_repository.interface.dart';

class SignUpUsecase {
  final ISignUpRepository signUpRepository;
  const SignUpUsecase({required this.signUpRepository});

  Future<void> call({
    required String username,
    required String password,
    required String email,
    required String nickname,
  }) async {
    try {
      await signUpRepository.signUp(
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
