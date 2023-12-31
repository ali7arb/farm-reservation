import 'package:farms_reservation/features/home_screen/widget/custem_text_name.dart';
import 'package:farms_reservation/features/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custem_photo_profile.dart';

class HeadHomeScreen extends StatelessWidget {
  const HeadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ProfileScreen());
      },
      child: Row(
        children: [
          const CustemPhotoProfile(
            image: 'assets/images/profile.webp',
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Welcome Back,',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              CustemTextName(
                name: 'Ali Harb',
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
