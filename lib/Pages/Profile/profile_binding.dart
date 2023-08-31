import 'package:get/get.dart';
import 'package:student_app/xcore.dart';
import 'xcore.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
