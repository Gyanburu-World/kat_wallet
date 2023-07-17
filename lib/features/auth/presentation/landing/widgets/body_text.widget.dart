import 'package:flutter/material.dart';

import '../../../../shared/view_controller.interface.dart';
import '../../../domain/bindings/landing/landing_controller.interface.dart';

class BodyTextWidget extends ViewController<ILandingController> {
  const BodyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i18n.strings.landing.titleBodyText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        Text(
          i18n.strings.landing.bodyText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
