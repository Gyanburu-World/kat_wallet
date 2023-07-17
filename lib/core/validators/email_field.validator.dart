import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator.interface.dart';

class EmailFieldValidator<T> extends Equatable implements IFieldValidator<T> {
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  String? validate(T? value) {
    final email = value as String?;
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!isValidEmail(email)) {
      return 'Invalid email format';
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
