import 'package:flutter/foundation.dart';

import '../abstractions/field.interface.dart';

class ReactFieldModel<T> extends IField<T> {
  T? _value;
  final _valueNotifier = ValueNotifier<T?>(null);
  final _error = ValueNotifier<String?>(null);

  var firstTimeAux = true;
  final bool validateOnType;

  ReactFieldModel({
    T? value,
    required super.validators,
    this.validateOnType = true,
  }) : _value = value {
    _valueNotifier.value = value;
    _valueNotifier.addListener(() {
      onChange(_valueNotifier.value);
    });
  }

  @override
  T? get value => _value;

  @override
  ValueNotifier<T?> get valueNotifier => _valueNotifier;

  @override
  ValueNotifier<String?> get errorStream => _error;

  @override
  bool get hasError => _error.value != null;

  @override
  void clearError() => _error.value = null;

  @override
  void setError(String error) => _error.value = error;

  @override
  void onChange(dynamic val) {
    if (val != null) {
      firstTimeAux = false;
      _value = val;
      clearError();
    }

    if (!firstTimeAux && validateOnType) validate();
    onChangeCallback?.call(_value);
  }

  @override
  bool validate() {
    _error.value = super.validateValue(value);
    return _error.value == null;
  }

  @override
  void dispose() {
    _error.dispose();
    _valueNotifier.dispose();
    controller?.dispose();
  }
}
