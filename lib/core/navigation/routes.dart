class Routes {
  static Future<String> get initialRoute async {
    try {
      return landing;
    } catch (err) {
      return landing;
    }
  }

  static const landing = '/landing';
  static const login = 'login';
  static const home = '/home';
}
