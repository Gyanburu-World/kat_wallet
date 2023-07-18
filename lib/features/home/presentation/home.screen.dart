import 'package:flutter/material.dart';

import '../../shared/view_controller.interface.dart';
import '../domain/abstractions/controllers/home_controller.interface.dart';

class HomeScreen extends ViewController<IHomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Test')),
    );
  }
}
