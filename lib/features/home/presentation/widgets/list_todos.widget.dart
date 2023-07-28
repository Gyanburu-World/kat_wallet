import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/domains/todo/domain/models/todo.model.dart';

class ListTodoWidget extends StatelessWidget {
  final Map<DateTime, List<TodoModel>> todos;
  const ListTodoWidget({super.key, required this.todos});

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
                final transaction = todos[date]![index];

                return ListTile(
                  tileColor: Colors.grey[900],
                  visualDensity: VisualDensity.comfortable,
                  onTap: () {},
                  title: Text(
                    transaction.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    transaction.isBilling ? 'A cobrar' : 'A pagar',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                        .format(transaction.value ?? 0),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return ListView(children: dateGroupWidgets);
  }
}
