import 'dart:async';
import 'package:http/http.dart' as http;

class TokenClient extends http.BaseClient {
  final String? token;
  final http.Client _inner = http.Client();

  TokenClient(this.token);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }
}
