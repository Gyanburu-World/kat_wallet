import 'package:flutter/foundation.dart';
import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../../../../core/abstractions/controller.interface.dart';

abstract class IHomeController extends IController {
  void init();

  ValueNotifier<Map<DateTime, List<TodoModel>>> get todos;

  Future<void> logout();
}
