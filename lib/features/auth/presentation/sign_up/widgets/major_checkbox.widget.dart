import 'package:flutter/material.dart';

import '../../../../shared/view_controller.interface.dart';
import '../../../domain/bindings/sign_up/sign_up_controller.interface.dart';

class MajorCheckboxWidget extends ViewController<ISignUpController> {
  const MajorCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
      valueListenable: controller.majorCheckField.valueNotifier,
      builder: (context, snapshot, _) {
        return CheckboxListTile(
          value: snapshot,
          dense: true,
          onChanged: (val) => controller.majorCheckField.value = val!,
          checkColor: Colors.white,
          tileColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(right: 0, left: 10),
          secondary: const Icon(Icons.person_4, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            i18n.strings.signUp.majorCheckField,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}
