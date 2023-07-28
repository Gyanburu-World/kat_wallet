import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../data/todo.data.dart';

abstract class TodoMapper {
  static TodoModel toModel(TodoData data) {
    return TodoModel(
      id: data.id,
      description: data.description,
      doAt: data.doAt,
      doneAt: data.doneAt,
      recurring: data.recurring,
      title: data.title,
      value: data.value,
      pay: data.pay,
    );
  }

  static TodoData toData(TodoModel model) {
    return TodoData(
      id: model.id,
      doAt: model.doAt,
      title: model.title,
      value: model.value,
      description: model.description,
      doneAt: model.doneAt,
      recurring: model.recurring,
      pay: model.pay,
    );
  }
}
