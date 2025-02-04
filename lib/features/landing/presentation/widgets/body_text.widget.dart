import 'package:flutter/material.dart';

import '../../../shared/view_controller.interface.dart';
import '../../binding/landing_controller.interface.dart';

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
        const SizedBox(height: 4),
        Text(
          i18n.strings.landing.bodyText,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
