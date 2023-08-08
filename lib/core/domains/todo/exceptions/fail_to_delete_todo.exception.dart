import '../../../base/abstractions/custom_exception.interface.dart';
import '../../../base/dal/data/error.data.dart';

class FailToDeleteTodoException implements CustomException {
  final ErrorData _failure;

  @override
  ErrorData get failure => _failure;

  FailToDeleteTodoException({required ErrorData failure}) : _failure = failure;
}
