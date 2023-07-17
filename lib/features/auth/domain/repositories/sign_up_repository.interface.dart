abstract class ISignUpRepository {
  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    required String nickname,
  });
}
