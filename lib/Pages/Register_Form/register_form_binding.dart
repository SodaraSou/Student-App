import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class RegisterFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterFormController>(
      () => RegisterFormController(),
    );
  }
}
