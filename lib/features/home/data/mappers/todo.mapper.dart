import 'package:project_quest/features/home/domain/models/todo.model.dart';

import '../data/todo.data.dart';

abstract class TodoMapper {
  static TodoModel toModel(TodoData data) {
    return TodoModel(
      id: data.id,
      date: data.date,
      isBilling: data.isBilling,
      title: data.title,
      value: data.value,
    );
  }
}
