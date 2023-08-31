import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class StudentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }
}