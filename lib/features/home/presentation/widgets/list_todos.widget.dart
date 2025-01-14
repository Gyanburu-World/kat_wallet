import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/domains/todo/domain/models/todo.model.dart';

class ListTodoWidget extends StatelessWidget {
  final Map<DateTime, List<TodoModel>> todos;
  final void Function(TodoModel) onTap;
  final void Function(TodoModel) onLongPress;
  const ListTodoWidget({
    super.key,
    required this.todos,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> dateGroupWidgets = [];
    for (final date in todos.keys) {
      dateGroupWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 6),
              child: Text(
                DateFormat('dd/MM/yyyy').format(date),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todos[date]!.length,
              separatorBuilder: (_, __) => const SizedBox(height: 3),
              itemBuilder: (_, int index) {
                final todo = todos[date]![index];

                return ListTile(
                  tileColor: Colors.grey[900],
                  visualDensity: VisualDensity.comfortable,
                  onTap: () => onTap(todo),
                  onLongPress: () => onLongPress(todo),
                  title: Text(
                    todo.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    todo.isBilling ? 'A pagar' : 'A cobrar',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                        .format(todo.value ?? 0),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Visibility(
      visible: todos.keys.isNotEmpty,
      replacement: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Crie seu primeiro item ao clicar no botão flutuante na parte inferior da tela',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: dateGroupWidgets,
      ),
    );
  }
}
