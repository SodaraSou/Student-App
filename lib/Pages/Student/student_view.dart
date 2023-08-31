import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class StudentView extends GetView<StudentController> {
  StudentView({super.key});

  final ref = FirebaseDatabase.instance.ref('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            final id = snapshot.key.toString();
            return ListTile(
              leading: Text(snapshot.child('id').value.toString()),
              title: Text(snapshot.child('first_name').value.toString()),
              subtitle: Text(snapshot.child('last_name').value.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => controller.toProfile(id),
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () => controller.toDelete(id),
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: TextButton(
        child: const Text('Add New Student'),
        onPressed: () => controller.toRegisterForm(),
      ),
    );
  }
}
