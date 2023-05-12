import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator.interface.dart';

class PasswordFieldValidator<T> extends Equatable
    implements IFieldValidator<T> {
  @override
  String? validate(T? value) {
    const message = 'Invalid Password: At least 6 characters';
    if (value == null) return message;
    if (value is String && value.length < 6) return message;

    return null;
  }

  @override
  List<Object?> get props => [];
}
