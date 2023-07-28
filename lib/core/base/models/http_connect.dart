import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

import '../../../config.dart';
import '../abstractions/http_connect.interface.dart';
import '../abstractions/response.model.dart';
import '../exceptions/http_failure.exception.dart';

class HttpConnect implements IHttpConnect {
  final http.Client _client;
  HttpConnect(http.Client client) : _client = client;
  final urlConfig = ConfigEnvironments.getEnvironments()['url'];

  String get urlBase =>
      urlConfig != null ? urlConfig! : throw Exception('Url not found');

  @override
  Future<Response<T>> get<T>(
    String urlPath, {
    required T Function(Map<String, dynamic>)? decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> post<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    var response = await _client.post(
      Uri.parse('$urlBase/$urlPath'),
      body: body,
    );

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    T? decoded;

    try {
      decoded = decoder?.call(json);
    } catch (err) {
      developer.log(
        'POST | Failed to decode the response body',
        error: response.body,
        name: 'HttpConnect',
      );
      rethrow;
    }

    final obj = Response<T>(statusCode: response.statusCode, payload: decoded);

    final payload = obj.payload;
    if (!obj.success && payload != null) {
      throw HttpFailureException<T>(object: payload);
    }

    return obj;
  }

  @override
  Future<Response<T>> patch<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> delete<T>(
    String urlPath, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> postMultipartFile<T>(
    String urlPath,
    form, {
    T Function(Map<String, dynamic>)? decoder,
  }) {
    throw UnimplementedError();
  }
}