import './response.model.dart';

abstract class IHttpConnect {
  Future<Response<T>> get<T>(
    String urlPath, {
    required T Function(Map<String, dynamic>)? decoder,
  });

  Future<Response<T>> post<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  });

  Future<Response<T>> put<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  });

  Future<Response<T>> patch<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  });

  Future<Response<T>> delete<T>(
    String urlPath, {
    required T Function(Map<String, dynamic>)? decoder,
  });

  Future<Response<T>> postMultipartFile<T>(
    String urlPath,
    dynamic form, {
    T Function(Map<String, dynamic>)? decoder,
  });
}
