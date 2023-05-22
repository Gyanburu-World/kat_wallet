import '../../../../core/dal/data/error.data.dart';

class UserOrPasswordIncorrectException implements Exception {
  final ErrorData failure;
  UserOrPasswordIncorrectException({required this.failure});
}
