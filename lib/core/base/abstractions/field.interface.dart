import 'package:flutter/cupertino.dart';

import 'validators/validator.interface.dart';

abstract class IField<T> extends IValidator<T> {
  T? get value;
  ValueNotifier<T?> get valueNotifier;
  Stream<String?> get errorStream;
  final TextEditingController? controller;

  IField({required super.validators, this.controller});

  void onChange(dynamic val);
  void Function(T? val)? onChangeCallback;
  void clearError();
  void setError(String error);
  void dispose();

  @override
  bool operator ==(Object other) {
    if (runtimeType == other.runtimeType) {
      var obj = other as IField;
      if (obj.value != other.value) return false;
      if (validators.length != other.validators.length) return false;
      for (var val1 in validators) {
        final hasThisValidator = other.validators.any((e) => e == val1);
        if (!hasThisValidator) return false;
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}
