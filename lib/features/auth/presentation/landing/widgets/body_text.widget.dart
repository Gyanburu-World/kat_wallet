import 'package:flutter/material.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Embark on Quests',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        Text(
          'With a range of quests to choose from and the ability to create your own, Quest Land is the perfect platform for exploring and challenging yourself. Stay focused on your goals and join the adventure today.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
