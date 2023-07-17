import 'package:flutter/material.dart';

import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/landing/landing_controller.interface.dart';
import 'widgets/body_text.widget.dart';
import 'widgets/buttons.widget.dart';
import 'widgets/header.widget.dart';

class LandingScreen extends ViewController<ILandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: HeaderWidget()),
              SizedBox(height: 16),
              Expanded(child: BodyTextWidget()),
              ButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
