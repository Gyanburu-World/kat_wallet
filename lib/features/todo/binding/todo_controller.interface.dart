import 'package:flutter/foundation.dart';

import '../../../../core/base/abstractions/controller.interface.dart';
import '../../../core/base/abstractions/field.interface.dart';

abstract class ITodoController extends IController {
  void init();

  IField<String> get title;
  IField<String> get description;
  IField<double> get value;
  IField<bool> get isRecurring;
  IField<bool> get isBilling;
  IField<DateTime> get doAt;

  ValueListenable<bool> get isToEdit;

  Future<bool> createTodo();
  Future<bool> editTodo();
  Future<void> deleteTodo();
}
