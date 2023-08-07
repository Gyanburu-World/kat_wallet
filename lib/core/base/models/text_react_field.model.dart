import 'package:flutter/material.dart';

import '../abstractions/field.interface.dart';

class TextReactFieldModel<T> extends IField<T> {
  T? _value;
  final _valueNotifier = ValueNotifier<T?>(null);
  final _error = ValueNotifier<String?>(null);

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
  ValueNotifier<String?> get errorStream => _error;

  @override
  bool get hasError => _error.value != null;

  @override
  void clearError() => _error.value = null;

  @override
  void setError(String error) => _error.value = error;

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
