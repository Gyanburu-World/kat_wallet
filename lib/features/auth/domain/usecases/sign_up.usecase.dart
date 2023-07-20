import '../repositories/sign_up_repository.interface.dart';

class SignUpUsecase {
  final ISignUpRepository signUpRepository;
  const SignUpUsecase({required this.signUpRepository});

  Future<void> call({
    required String username,
    required String password,
    required String email,
    required String? centralUser,
    required bool isCentral,
    required bool isCashier,
    required bool isDeliveryman,
  }) async {
    try {
      await signUpRepository.signUp(
        username: username,
        password: password,
        email: email,
        centralUser: centralUser,
        isDeliveryman: isDeliveryman,
        isCashier: isCashier,
        isCentral: isCentral,
      );
    } catch (err) {
      rethrow;
    }
  }
}
