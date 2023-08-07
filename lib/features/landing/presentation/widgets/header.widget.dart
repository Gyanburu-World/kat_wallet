import 'package:flutter/material.dart';

import '../../../shared/view_controller.interface.dart';
import '../../binding/landing_controller.interface.dart';

class HeaderWidget extends ViewController<ILandingController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xFF2E2E2E)),
      child: Text(
        i18n.strings.landing.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
