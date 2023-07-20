import 'package:flutter/foundation.dart';
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
    controller?.addListener(() => onChange(controller?.text as T));
  }

  @override
  T? get value => _value;

  @override
  set value(T? val) {
    onChange(val);
  }

  @override
  ValueListenable<T?> get valueNotifier => _valueNotifier;

  @override
  Stream<String?> get errorStream => _error.stream;

  @override
  bool get hasError => _error.value != null;

  @override
  void clearError() => _error.sink.add(null);

  @override
  void setError(String error) => _error.sink.add(error);

  @override
  void onChange(T? val) {
    if (val != null && val is String) {
      if ((runtimeType == TextReactFieldModel<double>) ||
          runtimeType == TextReactFieldModel<int>) {
        dynamic parse;
        final onlyNumber = val.replaceAll(RegExp('[^0-9.]'), '');
        parse = num.tryParse(onlyNumber);
        _value = parse;
        firstTimeAux = false;
      } else if (runtimeType == TextReactFieldModel<String>) {
        _value = val;
        if (val == '') {
          controller?.text = val;
        } else {
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
