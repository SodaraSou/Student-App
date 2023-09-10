import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class SignUpController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final department = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final userId = RxString('');

  void checkPassword() {
    if (password.text.trim() != confirmPassword.text.trim()) {
      Get.snackbar('Error', 'Password does not match');
    } else {
      registerUser();
    }
  }

  Future<void> registerUser() async {
    // Create user account
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    // Create user database
    userId.value = auth.currentUser!.uid;
    try {
      await ref.child('data').child(userId.value).set({
        'email': email.text.trim(),
        'password': password.text.trim(),
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'department': department.text.trim(),
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    Get.offNamed(PageRouter.home(auth.currentUser!.uid));
  }
}
