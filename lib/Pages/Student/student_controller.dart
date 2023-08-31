import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class StudentController extends GetxController {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('data');

  void toProfile(String id) {
    Get.toNamed(
      PageRouter.studentDetail(
        id,
      ),
    );
  }

  void toRegisterForm() {
    Get.toNamed(
      PageRouter.registerForm,
    );
  }

  void toDelete(String id) {
    ref.child(id).remove();
  }
}
