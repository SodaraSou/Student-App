import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/xcore.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: const Row(
                children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  kHalfSizedBox,
                  Text('Report'),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.uploadImage();
                    },
                    child: Obx(
                      () => CircleAvatar(
                        maxRadius: 50,
                        minRadius: 50,
                        backgroundImage: Image.network(
                          controller.photoUrl.value,
                        ).image,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Obx(
                    () {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                ('${controller.firstName.value} '),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                controller.lastName.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${controller.department.value} | Class: N/A',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const Row(
              children: [
                ProfileDetailBox(value: 'N/A', title: 'Registration Number'),
                ProfileDetailBox(value: 'N/A', title: 'Academic Year'),
              ],
            ),
            Row(
              children: [
                Obx(() => ProfileDetailBox(
                    value: controller.dob.value, title: 'Date of Birth')),
                const ProfileDetailBox(value: 'N/A', title: 'Gender'),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kHalfSizedBox,
                      Obx(
                        () => Text(
                          controller.email.value,
                          style: const TextStyle(
                            color: kTextBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kHalfSizedBox,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: const Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.lock_outlined,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kHalfSizedBox,
                      Obx(
                        () => Text(
                          controller.phoneNumber.value,
                          style: const TextStyle(
                            color: kTextBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kHalfSizedBox,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: const Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.lock_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => controller.signOut(),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}

class ProfileDetailBox extends StatelessWidget {
  const ProfileDetailBox({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: kDefaultPadding,
        left: kDefaultPadding,
      ),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kTextLightColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: const TextStyle(
                  color: kTextBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1,
                ),
              )
            ],
          ),
          const Icon(
            Icons.lock_outlined,
          ),
        ],
      ),
    );
  }
}
