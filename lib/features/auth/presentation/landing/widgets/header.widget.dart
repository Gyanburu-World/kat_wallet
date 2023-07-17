import 'package:flutter/material.dart';

import '../../../../shared/view_controller.interface.dart';
import '../../../domain/bindings/landing/landing_controller.interface.dart';
import '../../../domain/constants/landing_assets.constants.dart';

class HeaderWidget extends ViewController<ILandingController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF2E2E2E),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i18n.strings.landing.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: Center(
                    child: Image.asset(LandingAssetsConstants.logo),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
