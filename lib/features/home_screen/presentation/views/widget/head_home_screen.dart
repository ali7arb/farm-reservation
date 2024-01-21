import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../profile_screen/auth/profile_view_controller.dart';
import '../../../../profile_screen/presentation/views/profile_screen.dart';
import 'custem_photo_profile.dart';
import 'custem_text_name.dart';
import 'notification_screen.dart';

class HeadHomeScreen extends StatelessWidget {
  const HeadHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(ProfileScreen());
        },
        child: GetBuilder<ProfileViewController>(
          init: ProfileViewController(),
          builder: (controller) {
            return Row(
              children: [
                CustemPhotoProfile(
                  image: controller.userModel?.pic ??
                      'https://yourteachingmentor.com/wp-content/uploads/2020/12/istockphoto-1223671392-612x612-1.jpg',
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, Welcome Back,',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    CustemTextName(
                      name: controller.userModel?.name ?? '',
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.to(const NotificationScreen());
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
