import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class PageRouter {
  static const String home = '/home';
  static const String splashScreen = '/splashScreen';
  static const String student = '/student';
  static const String registerForm = '/registerForm';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static String studentDetail(String id) => '/studentDetail/$id';

  static final pages = [
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
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
