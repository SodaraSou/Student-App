import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    super.initState();
    _navigateToLogin(user);
  }

  void _navigateToLogin(user) async {
    await Future.delayed(const Duration(seconds: 2));
    if (user != null) {
      Get.offNamed(PageRouter.home(user.uid));
    } else {
      Get.offNamed(PageRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Student',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 50,
                    ),
              ),
              Text(
                'App',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 50,
                    ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/splash.png',
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
