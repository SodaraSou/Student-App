import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/Core/colors.dart';
import 'package:student_app/Pages/xcore.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    'New To the App?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                  color: kOtherColor),
            ),
          ],
        ),
      ),
    );
  }
}
