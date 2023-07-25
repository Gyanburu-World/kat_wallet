import 'package:flutter/foundation.dart';
import 'package:project_quest/features/home/domain/models/todo.model.dart';

import '../../../../core/abstractions/controller.interface.dart';

abstract class IHomeController extends IController {
  void init();

  ValueNotifier<Map<DateTime, List<TodoModel>>> get todos;
}
