import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  final id = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final department = TextEditingController();
  final email = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('data');

  void addStudent() async {
    await ref.push().set({
      "id": id.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "department": department.text,
      "email": email.text,
    });
    Get.back();
  }
}
