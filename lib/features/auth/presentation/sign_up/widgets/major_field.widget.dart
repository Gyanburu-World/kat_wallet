import 'package:flutter/material.dart';
import 'package:project_quest/features/auth/domain/bindings/sign_up/sign_up_controller.interface.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';
import 'package:project_quest/features/shared/view_controller.interface.dart';

class CentralFieldWidget extends ViewController<ISignUpController> {
  const CentralFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.cashierCheckField.valueNotifier,
      builder: (_, snapCashier, __) {
        return ValueListenableBuilder(
          valueListenable: controller.deliverymanCheckField.valueNotifier,
          builder: (_, snapDelivery, __) {
            if (snapDelivery! || snapCashier!) {
              return TextFieldWidget(
                label: i18n.strings.signUp.centralField,
                field: controller.centralField,
              );
            }

            return const SizedBox();
          },
        );
      },
    );
  }
}
