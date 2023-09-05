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
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                            ),
                            controller: controller.firstName,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                            ),
                            controller: controller.lastName,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Department',
                            ),
                            controller: controller.department,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            controller: controller.email,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            controller: controller.password,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                              color: kTextBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                            ),
                            controller: controller.confirmPassword,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          InkWell(
                            onTap: () => controller.registerUser(),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
                                color: kPrimaryColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: kTextWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
