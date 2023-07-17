import 'package:flutter/material.dart';
import 'package:project_quest/core/navigation/go_router_builder.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => onJoinNowPressed(context),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: const Color(0xFFDA8017),
          ),
          child: const Text(
            'Join Now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: Colors.white,
          ),
          child: const Text(
            'Already have an account? Sign in',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF757575),
            ),
          ),
        ),
      ],
    );
  }

  void onJoinNowPressed(BuildContext context) {
    LoginScreenRoute().go(context);
  }
}
