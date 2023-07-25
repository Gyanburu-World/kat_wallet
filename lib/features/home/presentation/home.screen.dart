import 'package:flutter/material.dart';
import 'package:project_quest/core/style/colors.dart';

import '../../../core/dal/storage/storage.interface.dart';
import '../../../core/inject.dart';
import '../../shared/view_controller.interface.dart';
import '../domain/abstractions/controllers/home_controller.interface.dart';

class HomeScreen extends ViewController<IHomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CColors.background),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final storage = Inject.find<IStorage>();
          storage.clear();
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(child: Text('Test')),
    );
  }
}
