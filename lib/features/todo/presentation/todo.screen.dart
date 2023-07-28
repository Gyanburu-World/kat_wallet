import 'package:flutter/material.dart';
import 'package:project_quest/features/auth/presentation/sign_up/widgets/checkbox.widget.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../core/base/style/colors.dart';
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
              TextFieldWidget(label: 'Título*', field: widget.controller.title),
              const SizedBox(height: 12),
              TextFieldWidget(
                label: 'Descrição',
                field: widget.controller.description,
              ),
              const SizedBox(height: 12),
              TextFieldWidget(
                label: 'Valor',
                field: widget.controller.description,
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
            ],
          ),
        ),
      ),
    );
  }
}
