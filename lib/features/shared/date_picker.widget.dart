import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/base/abstractions/field.interface.dart';
import '../../core/base/style/colors.dart';

class DatePickerWidget extends StatefulWidget {
  final IField<DateTime> field;
  const DatePickerWidget({super.key, required this.field});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.field.valueNotifier,
      builder: (_, __, ___) => Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.field.value == null
                        ? 'Selecione uma data*'
                        : DateFormat('dd/MM/yyyy').format(widget.field.value!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.calendar_today_outlined, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() async {
    final theme = Theme.of(context);

    final date = await showDatePicker(
      context: context,
      initialDate: widget.field.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: const Color(CColors.background),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      widget.field.value = date;
    }
  }
}
