import 'package:flutter/material.dart';
import 'package:project_quest/features/auth/domain/bindings/sign_up/sign_up_controller.interface.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';
import 'package:project_quest/features/shared/view_controller.interface.dart';

class MajorFieldWidget extends ViewController<ISignUpController> {
  const MajorFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.majorCheckField.valueNotifier,
      builder: (_, snap, __) {
        if (snap!) {
          return TextFieldWidget(
            label: i18n.strings.signUp.majorField,
            field: controller.majorField,
          );
        }

        return const SizedBox();
      },
    );
  }
}
