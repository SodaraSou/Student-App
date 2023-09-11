import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/xcore.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance;
  final dataRef = FirebaseDatabase.instance;
  final imagePicker = ImagePicker();
  final firstName = RxString('');
  final lastName = RxString('');
  final department = RxString('');
  final email = RxString('');
  final phoneNumber = RxString('');
  final dob = RxString('');
  final studentId = RxString('');
  final photoUrl = RxString('');

  @override
  void onInit() {
    studentId.value = Get.parameters['id']!;
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      DataSnapshot data = await dataRef.ref().child('data/$studentId').get();
      firstName.value = data.child('firstName').value.toString();
      lastName.value = data.child('lastName').value.toString();
      department.value = data.child('department').value.toString();
      email.value = data.child('email').value.toString();
      phoneNumber.value = data.child('phoneNumber').value.toString();
      dob.value = data.child('dob').value.toString();
      photoUrl.value = data.child('photoUrl').value.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> uploadImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    try {
      await storageRef
          .ref()
          .child('images/$studentId')
          .putFile(File(file.path));
      photoUrl.value =
          await storageRef.ref().child('images/$studentId').getDownloadURL();
      await dataRef
          .ref()
          .child('data/$studentId')
          .update({'photoUrl': photoUrl.value});
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
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
      Get.offAllNamed(PageRouter.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
