import 'package:flutter/material.dart';

class ConfirmDeleteTodoDialog extends StatelessWidget {
  final void Function() onPressedYes;
  const ConfirmDeleteTodoDialog({super.key, required this.onPressedYes});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Você tem certeza?'),
      content: const Text('Você deseja excluir esse item?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('NÃO'),
        ),
        TextButton(
          onPressed: onPressedYes,
          child: const Text('SIM'),
        ),
      ],
    );
  }
}
