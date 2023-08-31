import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class HomeController extends GetxController {
  void toStudentPage() {
    Get.toNamed(PageRouter.student);
  }
}
