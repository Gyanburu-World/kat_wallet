import 'package:flutter/material.dart';

import '../../shared/view_controller.interface.dart';
import '../binding/todo_controller.interface.dart';

class TodoScreen extends ViewStateController<ITodoController> {
  const TodoScreen({super.key});

  @override
  State<ViewStateController<ITodoController>> createState() {
    return _TodoScreenState();
  }
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('eae')),
    );
  }
}
