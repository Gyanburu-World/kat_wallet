import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/base/style/colors.dart';
import '../../../core/navigation/routes.dart';
import '../../shared/loading/loading.widget.dart';
import '../../shared/view_controller.interface.dart';
import '../domain/bindings/home_controller.interface.dart';
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
          builder: (_, snap, ___) => ListTodoWidget(todos: snap),
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
      builder: (context) => AlertDialog(
        title: const Text('Você tem certeza?'),
        content: const Text('Você deseja sair do app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('NÃO'),
          ),
          TextButton(
            onPressed: () {
              widget.controller.logout();
              context.goNamed(Routes.login);
            },
            child: const Text('SIM'),
          ),
        ],
      ),
    );
  }
}
