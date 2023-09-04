import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void toStudentPage() {
    Get.toNamed(PageRouter.student);
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.toNamed(PageRouter.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
