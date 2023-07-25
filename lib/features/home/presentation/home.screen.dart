import 'package:flutter/material.dart';
import 'package:project_quest/core/style/colors.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Lista Financeira'),
        ),
        body: ValueListenableBuilder(
          valueListenable: widget.controller.todos,
          builder: (_, snap, ___) => ListTodoWidget(todos: snap),
        ),
      ),
    );
  }
}
