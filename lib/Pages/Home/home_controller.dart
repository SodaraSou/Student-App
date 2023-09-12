import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class HomeController extends GetxController {
  final dataRef = FirebaseDatabase.instance;
  final firstName = RxString('');
  final department = RxString('');
  // final _class = RxString('');
  final userId = RxString('');
  final photoUrl = RxString('');

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
    try {
      DataSnapshot data = await dataRef.ref().child('data/$userId').get();
      firstName.value = data.child('firstName').value.toString();
      department.value = data.child('department').value.toString();
      photoUrl.value = data.child('photoUrl').value.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
