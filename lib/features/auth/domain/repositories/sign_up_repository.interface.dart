abstract class ISignUpRepository {
  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    required String? centralUser,
    required bool isCentral,
    required bool isCashier,
    required bool isDeliveryman,
  });
}
