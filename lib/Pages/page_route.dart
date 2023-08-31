import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class PageRouter {
  static const String home = '/';
  static const String student = '/student';
  static const String registerForm = '/registerForm';
  static String studentDetail(String id) => '/studentDetail/$id';

  static final pages = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: student,
      page: () => StudentView(),
      binding: StudentBinding(),
    ),
    GetPage(
      name: registerForm,
      page: () => const RegisterFormView(),
      binding: RegisterFormBinding(),
    ),
    GetPage(
      name: studentDetail(':id'),
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
