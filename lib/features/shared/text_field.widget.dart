import 'package:flutter/material.dart';
import 'package:project_quest/core/validators/password_field.validator.dart';

import '../../core/abstractions/field.interface.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final IField field;
  const TextFieldWidget({required this.field, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: field.errorStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: field.controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          obscureText: field.validators.any((e) => e is PasswordFieldValidator),
          decoration: InputDecoration(
            filled: true,
            labelText: label,
            fillColor: Colors.grey[200],
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            errorText: snapshot.data,
          ),
        );
      },
    );
  }
}
