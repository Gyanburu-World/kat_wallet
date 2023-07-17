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
          style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2E2E2E),
            labelText: label,
            labelStyle: const TextStyle(color: Color(0xFFBEBEBE), fontSize: 20),
            errorText: snapshot.data,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
