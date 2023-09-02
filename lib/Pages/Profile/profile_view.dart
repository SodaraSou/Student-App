import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  TextField(
                    readOnly: controller.readOnly.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                    controller: controller.firstName,
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    readOnly: controller.readOnly.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                    controller: controller.lastName,
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    readOnly: controller.readOnly.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                    ),
                    controller: controller.department,
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    readOnly: controller.readOnly.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    controller: controller.firstName,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => controller.signOut(),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
