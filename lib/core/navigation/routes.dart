import '../../features/auth/dal/repositories/login.repository.dart';
import '../inject.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authRepository = LoginRepository(
        authDatasource: Inject.find(),
        storage: Inject.find(),
      );

      final isUserLoggedIn = await authRepository.isUserLoggedIn();
      if (isUserLoggedIn) return home;
      return landing;
    } catch (err) {
      return landing;
    }
  }

  static const landing = '/landing';
  static const login = 'login';
  static const signUp = 'sign-up';
  static const home = '/home';
}
