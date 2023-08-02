import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../abstractions/field.interface.dart';

class ReactFieldModel<T> extends IField<T> {
  T? _value;
  final _valueNotifier = ValueNotifier<T?>(null);
  final _error = BehaviorSubject<String?>();

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
  Stream<String?> get errorStream => _error.stream;

  @override
  bool get hasError => _error.value != null;

  @override
  void clearError() => _error.sink.add(null);

  @override
  void setError(String error) => _error.sink.add(error);

  @override
  void onChange(dynamic val) {
    if (val != null) {
      firstTimeAux = false;
      _value = val;
    }

    if (!firstTimeAux && validateOnType) validate();
    onChangeCallback?.call(_value);
  }

  @override
  bool validate() {
    _error.sink.add(super.validateValue(value));
    return _error.value == null;
  }

  @override
  void dispose() {
    _error.close();
    controller?.dispose();
  }
}
