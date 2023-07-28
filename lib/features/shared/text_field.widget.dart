import 'package:flutter/material.dart';

import '../../core/base/abstractions/field.interface.dart';
import '../../core/base/validators/password_field.validator.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final IField field;
  final bool useLabelAsHint;
  const TextFieldWidget({
    required this.field,
    required this.label,
    super.key,
    this.useLabelAsHint = false,
  });

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
            labelText: useLabelAsHint ? null : label,
            labelStyle: const TextStyle(color: Color(0xFFBEBEBE), fontSize: 16),
            hintText: useLabelAsHint ? label : null,
            hintStyle: const TextStyle(color: Color(0xFFBEBEBE), fontSize: 16),
            errorText: snapshot.data,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
