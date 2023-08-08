import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_quest/core/base/utils/snackbar.util.dart';
import 'package:project_quest/features/shared/checkbox.widget.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';
import 'package:project_quest/features/todo/presentation/widgets/dialog/confirm_delete_todo.dialog.dart';

import '../../../core/base/style/colors.dart';
import '../../../core/domains/todo/exceptions/create_todo_fail.exception.dart';
import '../../../core/domains/todo/exceptions/fail_to_edit_todo.exception.dart';
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
          title: ValueListenableBuilder(
            valueListenable: widget.controller.isToEdit,
            builder: (_, bool value, __) {
              return Text(value ? 'Editando' : 'Criando');
            },
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: deleteTodo,
              icon: const Icon(Icons.delete),
            )
          ],
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
                        label: 'É uma conta para pagar?',
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
              ValueListenableBuilder(
                valueListenable: widget.controller.isToEdit,
                builder: (_, bool value, __) {
                  return PrimaryButtonWidget(
                    text: value ? 'Atualizar' : 'Criar',
                    onPressed: value ? editTodo : createTodo,
                  );
                },
              )
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

  void editTodo(BuildContext context) async {
    try {
      final success = await widget.controller.editTodo();
      if (mounted && success) {
        context.pop();
        showSuccessSnackbar(
          context: context,
          title: 'Sucesso',
          message: 'Editado com sucesso!',
        );
      }
    } on FailToEditTodoException catch (err) {
      showErrorSnackbar(context: context, err: err);
    }
  }

  void deleteTodo() async {
    showDialog(
      context: context,
      builder: (_) {
        return ConfirmDeleteTodoDialog(
          onPressedYes: () async {
            await widget.controller.deleteTodo();
            if (mounted) {
              context.pop();
              context.pop();
            }
          },
        );
      },
    );
  }
}
