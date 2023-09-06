import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  void toSignUp() {
    Get.toNamed(PageRouter.signUp);
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.offNamed(PageRouter.home);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
