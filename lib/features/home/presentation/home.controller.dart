import 'package:flutter/foundation.dart';
import 'package:project_quest/core/domains/todo/domain/models/todo.model.dart';

import '../../shared/loading/loading.interface.dart';
import '../bindings/home_controller.interface.dart';
import '../usecases/delete_todo.usecase.dart';
import '../usecases/get_todos.usecase.dart';
import '../usecases/logout.usecase.dart';

class HomeController implements IHomeController {
  final ILoadingController loading;
  final GetTodosUsecase getTodosUsecase;
  final LogoutUsecase logoutUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;

  final _todos = ValueNotifier<Map<DateTime, List<TodoModel>>>({});

  @override
  ValueNotifier<Map<DateTime, List<TodoModel>>> get todos => _todos;

  HomeController({
    required this.loading,
    required this.getTodosUsecase,
    required this.logoutUsecase,
    required this.deleteTodoUsecase,
  });

  @override
  void init() async {
    fetchTodos();
  }

  void fetchTodos() async {
    try {
      loading.isLoading = true;
      final response = await getTodosUsecase();
      final grouped = groupTodos(response);
      _todos.value = grouped;
    } finally {
      loading.isLoading = false;
    }
  }

  @override
  void reloadTodos() {
    fetchTodos();
  }

  Map<DateTime, List<TodoModel>> groupTodos(List<TodoModel> todos) {
    Map<DateTime, List<TodoModel>> groupedTodos = {};
    for (final todo in todos) {
      final date = DateTime(todo.doAt.year, todo.doAt.month, todo.doAt.day);
      if (!groupedTodos.containsKey(date)) {
        groupedTodos[date] = [];
      }
      groupedTodos[date]!.add(todo);
    }

    return groupedTodos;
  }

  @override
  Future<void> deleteTodo(TodoModel todo) async {
    await deleteTodoUsecase(todo);
  }

  @override
  Future<void> logout() async {
    await logoutUsecase();
  }

  @override
  void dispose() {
    _todos.dispose();
  }
}
