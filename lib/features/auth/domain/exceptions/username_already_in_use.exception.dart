import '../../../../core/abstractions/custom_exception.interface.dart';
import '../../../../core/dal/data/error.data.dart';

class UsernameAlreadyInUseException implements CustomException {
  final ErrorData _failure;

  @override
  ErrorData get failure => _failure;

  UsernameAlreadyInUseException({required ErrorData failure})
      : _failure = failure;
}
