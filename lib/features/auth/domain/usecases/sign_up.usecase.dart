import '../repositories/sign_up_repository.interface.dart';

class SignUpUsecase {
  final ISignUpRepository signUpRepository;
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
