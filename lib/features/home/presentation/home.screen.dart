import 'package:flutter/material.dart';
import 'package:project_quest/core/style/colors.dart';

import '../../shared/view_controller.interface.dart';
import '../domain/abstractions/controllers/home_controller.interface.dart';

class HomeScreen extends ViewController<IHomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(CColors.background),
      body: Center(child: Text('Test')),
    );
  }
}
