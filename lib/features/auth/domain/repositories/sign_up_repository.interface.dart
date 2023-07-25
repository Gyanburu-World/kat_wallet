abstract class ISignUpRepository {
  Future<void> signUp({required String email, required String password});
}
