import 'package:flutter/material.dart';
import 'package:student_app/xcore.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Student App'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => controller.toStudentPage(),
            child: const Text('View all students'),
          ),
        ),
      ),
    );
  }
}
