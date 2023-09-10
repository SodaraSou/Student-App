import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class HomeController extends GetxController {
  final firstName = RxString('');
  final department = RxString('');
  final userId = RxString('');

  @override
  void onInit() {
    userId.value = Get.parameters['id']!;
    getUserDetail();
    super.onInit();
  }

  void toProfilePage() {
    Get.toNamed(PageRouter.studentDetail(userId.value));
  }

  Future<void> getUserDetail() async {
    final ref = FirebaseDatabase.instance.ref('data/$userId');
    DataSnapshot data = await ref.get();
    firstName.value = data.child('firstName').value.toString();
    department.value = data.child('department').value.toString();
  }
}
