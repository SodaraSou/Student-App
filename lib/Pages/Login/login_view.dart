import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                    'Hi Student',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 6,
                  ),
                  Text('Login in to continue',
                      style: Theme.of(context).textTheme.bodyMedium),
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
                          TextFormField(
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
                          TextFormField(
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
                          InkWell(
                            onTap: () =>
                                controller.signInWithEmailAndPassword(),
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
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: kTextWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () => controller.toSignUp(),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
