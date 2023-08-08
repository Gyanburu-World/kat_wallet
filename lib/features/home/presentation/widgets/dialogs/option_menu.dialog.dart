import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/domains/todo/domain/models/todo.model.dart';
import 'confirm_exclude_item.dialog.dart';

enum OptionsMenuDialogResult { delete, deleteAll, edit }

class OptionsMenuDialog extends StatelessWidget {
  final TodoModel item;
  const OptionsMenuDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ExampleItem(todo: item),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Atualizar'),
              onTap: () => Navigator.of(context).pop(
                OptionsMenuDialogResult.edit,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Excluir item'),
              onTap: () => onClickExcludeItem(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              enabled: false,
              title: const Text('Excluir todas as recorrências'),
              onTap: () => Navigator.of(context).pop(
                OptionsMenuDialogResult.deleteAll,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClickExcludeItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ConfirmExcludeItemDialog(
        onPressedYes: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop(OptionsMenuDialogResult.delete);
        },
      ),
    );
  }
}

class _ExampleItem extends StatelessWidget {
  final TodoModel todo;
  const _ExampleItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[900],
      visualDensity: VisualDensity.comfortable,
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
  }
}
