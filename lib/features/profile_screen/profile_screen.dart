import 'package:farms_reservation/core/widgets/custem_button_widget.dart';
import 'package:farms_reservation/features/home_screen/widget/custem_text_name.dart';
import 'package:farms_reservation/features/login_screen/login_screen.dart';
import 'package:farms_reservation/features/profile_screen/mybooking_screen.dart';
import 'package:farms_reservation/features/profile_screen/widget/custom_button_profile.dart';
import 'package:farms_reservation/features/profile_screen/widget/custom_clip_path.dart';
import 'package:farms_reservation/features/profile_screen/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/style.dart';
import 'account_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    gradient: gradientColor2,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/profile.webp'),
                      )
                    ],
                  ),
                ),
              ),
              const CustemTextName(
                name: 'Ali Harb',
              ),
              CustomButtonProfile(
                onPressed: () {
                  Get.to(const AccountScreen());
                },
                text: 'Account',
                icon: Icons.account_circle_outlined,
              ),
              CustomButtonProfile(
                onPressed: () {
                  Get.to(const MyBookingScreen());
                },
                text: 'My Booking',
                icon: Icons.calendar_month,
              ),
              CustomButtonProfile(
                onPressed: () {
                  Get.to(const FavoriteScreen());
                },
                text: 'Favorite',
                icon: Icons.favorite,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustemButtonWidget(
                  title: 'Sign out',
                  onPressed: () {
                    Get.offAll(LoginScreen());
                  },
                  textColor: textColor,
                ),
              ),
            ],
          ),
        ));
  }
}
