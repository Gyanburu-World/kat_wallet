import 'package:flutter/material.dart';
import 'package:project_quest/core/navigation/go_router_builder.dart';

import '../../../../shared/primary_button.widget.dart';
import '../../../../shared/secondary_button.widget.dart';
import '../../../../shared/view_controller.interface.dart';
import '../../../domain/bindings/landing/landing_controller.interface.dart';

class ButtonsWidget extends ViewController<ILandingController> {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButtonWidget(
          text: i18n.strings.landing.joinNowButton,
          onPressed: onSignUpPressed,
        ),
        const SizedBox(height: 8),
        SecondaryButtonWidget(
          text: i18n.strings.landing.signInButton,
          onPressed: onSignInPressed,
        ),
      ],
    );
  }

  void onSignInPressed(BuildContext context) {
    LoginScreenRoute().go(context);
  }

  void onSignUpPressed(BuildContext context) {
    SignUpScreenRoute().go(context);
  }
}
