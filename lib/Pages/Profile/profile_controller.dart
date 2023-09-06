import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final readOnly = RxBool(false);
  final studentId = RxString('');
  final firstName = RxString('');
  final lastName = RxString('');
  final department = RxString('');
  final email = TextEditingController();

  @override
  void onInit() async {
    // studentId.value = Get.parameters['id']!;
    studentId.value = auth.currentUser!.uid;
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    final ref = FirebaseDatabase.instance.ref('data/$studentId');
    DataSnapshot data = await ref.get();
    firstName.value = data.child('firstName').value.toString();
    lastName.value = data.child('lastName').value.toString();
    department.value = data.child('department').value.toString();
    email.text = data.child('email').value.toString();
  }

  // void onUpdate() async {
  //   final ref = FirebaseDatabase.instance.ref('data/$studentId');
  //   await ref.update({
  //     'first_name': firstName.text,
  //     'last_name': lastName.text,
  //     'department': department.text,
  //     'email': email.text,
  //   });
  //   Get.back();
  // }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.toNamed(PageRouter.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
