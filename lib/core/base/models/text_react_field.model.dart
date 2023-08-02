import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../abstractions/field.interface.dart';

class TextReactFieldModel<T> extends IField<T> {
  T? _value;
  final _valueNotifier = ValueNotifier<T?>(null);
  final _error = BehaviorSubject<String?>();

  var firstTimeAux = true;
  final bool validateOnType;

  TextReactFieldModel({
    T? value,
    required super.validators,
    this.validateOnType = true,
  })  : _value = value,
        super(controller: TextEditingController()) {
    controller?.addListener(() => onChange(controller?.text as String));
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
    if (val != null && val is String) {
      if (runtimeType == TextReactFieldModel<double>) {
        dynamic parse;
        final onlyNumber = val.replaceAll(RegExp('[^0-9.]'), '');
        parse = double.tryParse(onlyNumber);
        _value = parse;
        firstTimeAux = false;
      } else if (runtimeType == TextReactFieldModel<String>) {
        _value = val as T?;
        if (val != '') {
          firstTimeAux = false;
        }
      }
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
  }
}
