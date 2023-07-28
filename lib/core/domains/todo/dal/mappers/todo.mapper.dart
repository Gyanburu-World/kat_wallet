import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../data/todo.data.dart';

abstract class TodoMapper {
  static TodoModel toModel(TodoData data) {
    return TodoModel(
      id: data.id,
      date: data.doAt,
      isBilling: true,
      title: data.title,
      value: data.value,
    );
  }
}
