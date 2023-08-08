import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_quest/core/base/utils/snackbar.util.dart';
import 'package:project_quest/features/home/presentation/widgets/dialogs/logout.dialog.dart';

import '../../../core/base/abstractions/custom_exception.interface.dart';
import '../../../core/base/style/colors.dart';
import '../../../core/domains/todo/domain/models/todo.model.dart';
import '../../../core/domains/todo/exceptions/fail_to_delete_todo.exception.dart';
import '../../../core/navigation/routes.dart';
import '../../shared/loading/loading.widget.dart';
import '../../shared/view_controller.interface.dart';
import '../bindings/home_controller.interface.dart';
import 'widgets/dialogs/option_menu.dialog.dart';
import 'widgets/list_todos.widget.dart';

class HomeScreen extends ViewStateController<IHomeController> {
  const HomeScreen({super.key});

  @override
  State<ViewStateController<IHomeController>> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    try {
      widget.controller.init();
    } on CustomException catch (err) {
      showErrorSnackbar(context: context, err: err);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        drawer: Drawer(
          backgroundColor: const Color(CColors.background),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: logout, child: const Text('Sair')),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Lista Financeira'),
        ),
        body: ValueListenableBuilder(
          valueListenable: widget.controller.todos,
          builder: (_, snap, ___) => ListTodoWidget(
            todos: snap,
            onTap: onTapTodo,
            onLongPress: onLongPress,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onFloatingActionButtonPressed,
          backgroundColor: Colors.black87,
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }

  void onFloatingActionButtonPressed() async {
    await context.pushNamed(Routes.todo);
    widget.controller.reloadTodos();
  }

  void logout() {
    showDialog(
      context: context,
      builder: (_) => LogoutDialog(
        onPressedYes: () {
          widget.controller.logout();
          context.goNamed(Routes.login);
        },
      ),
    );
  }

  void onTapTodo(TodoModel todo) async {
    try {
      await context.pushNamed(Routes.todo, extra: todo);
      widget.controller.reloadTodos();
    } on CustomException catch (err) {
      showErrorSnackbar(context: context, err: err);
    } catch (err) {
      rethrow;
    }
  }

  void onLongPress(TodoModel todo) async {
    try {
      final response = await showDialog<OptionsMenuDialogResult>(
        context: context,
        builder: (_) => OptionsMenuDialog(item: todo),
      );

      switch (response) {
        case OptionsMenuDialogResult.delete:
          await widget.controller.deleteTodo(todo);
          widget.controller.reloadTodos();
          break;
        case OptionsMenuDialogResult.deleteAll:
          // Excluir todas as recorrências
          break;
        case OptionsMenuDialogResult.edit:
          onTapTodo(todo);
          break;
        default:
      }
    } on FailToDeleteTodoException catch (err) {
      showErrorSnackbar(context: context, err: err);
    }
  }
}
