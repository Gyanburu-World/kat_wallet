import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_quest/core/base/utils/snackbar.util.dart';
import 'package:project_quest/features/shared/checkbox.widget.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../core/base/style/colors.dart';
import '../../../core/domains/todo/exceptions/create_todo_fail.exception.dart';
import '../../shared/date_picker.widget.dart';
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
  void initState() {
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        appBar: AppBar(
          title: const Text('Criando'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        label: 'Título*',
                        field: widget.controller.title,
                      ),
                      const SizedBox(height: 12),
                      TextFieldWidget(
                        label: 'Descrição',
                        field: widget.controller.description,
                      ),
                      const SizedBox(height: 12),
                      TextFieldWidget(
                        label: 'Valor',
                        field: widget.controller.value,
                        onlyNumber: true,
                      ),
                      const SizedBox(height: 12),
                      CheckboxWidget(
                        label: 'É cobrança?',
                        field: widget.controller.isBilling,
                        icon: Icons.monetization_on_outlined,
                      ),
                      const SizedBox(height: 12),
                      CheckboxWidget(
                        label: 'É recorrente?',
                        field: widget.controller.isRecurring,
                        icon: Icons.calendar_month,
                      ),
                      const SizedBox(height: 12),
                      DatePickerWidget(field: widget.controller.doAt),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              PrimaryButtonWidget(text: 'Criar', onPressed: createTodo)
            ],
          ),
        ),
      ),
    );
  }

  void createTodo(BuildContext context) async {
    try {
      final success = await widget.controller.createTodo();
      if (mounted && success) {
        context.pop();
        showSuccessSnackbar(
          context: context,
          title: 'Sucesso',
          message: 'Criado com sucesso!',
        );
      }
    } on FailToCreateTodoException catch (err) {
      showErrorSnackbar(context: context, err: err);
    }
  }
}
