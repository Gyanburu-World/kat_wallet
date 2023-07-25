import 'package:flutter/foundation.dart';
import 'package:project_quest/features/home/domain/models/todo.model.dart';
import 'package:project_quest/features/home/domain/usecases/get_todos.usecase.dart';

import '../../shared/loading/loading.interface.dart';
import '../domain/bindings/home_controller.interface.dart';

class HomeController implements IHomeController {
  final ILoadingController loading;
  final GetTodosUsecase getTodosUsecase;

  final _todos = ValueNotifier<Map<DateTime, List<TodoModel>>>({});

  @override
  ValueNotifier<Map<DateTime, List<TodoModel>>> get todos => _todos;

  HomeController({required this.getTodosUsecase, required this.loading});

  @override
  void init() async {
    try {
      loading.isLoading = true;
      final response = await getTodosUsecase();
      final grouped = groupTodos(response);
      _todos.value = grouped;
    } finally {
      loading.isLoading = false;
    }
  }

  Map<DateTime, List<TodoModel>> groupTodos(List<TodoModel> todos) {
    Map<DateTime, List<TodoModel>> groupedTodos = {};
    for (final todo in todos) {
      final date = DateTime(todo.date.year, todo.date.month, todo.date.day);
      if (!groupedTodos.containsKey(date)) {
        groupedTodos[date] = [];
      }
      groupedTodos[date]!.add(todo);
    }

    return groupedTodos;
  }

  @override
  void dispose() {
    _todos.dispose();
  }
}
