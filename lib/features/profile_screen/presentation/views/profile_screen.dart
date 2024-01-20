import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/profile_screen/auth/profile_view_controller.dart';
import 'package:reservation_farm/features/profile_screen/presentation/views/widget/custom_button_profile.dart';
import 'package:reservation_farm/features/profile_screen/presentation/views/widget/custom_clip_path.dart';
import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custem_button_widget.dart';
import '../../../home_screen/presentation/views/widget/custem_text_name.dart';
import '../../../login_screen/presentation/views/login_screen.dart';
import 'account_screen.dart';
import 'favorite_screen.dart';
import 'mybooking_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewController>(
      init: ProfileViewController(),
      builder: (controller) {
        ImageProvider<Object>? backgroundImage =
            const AssetImage('assets/images/northfarm.jpg');
        String profileName = '';

        if (controller.userModel != null) {
          backgroundImage = NetworkImage(controller.userModel!.pic!);
          profileName = controller.userModel!.name ?? '';
        }

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
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: backgroundImage,
                        ),
                      ],
                    ),
                  ),
                ),
                CustemTextName(
                  name: profileName,
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
                    Get.to(MyBookingScreen());
                  },
                  text: 'My Booking',
                  icon: Icons.calendar_month,
                ),
                CustomButtonProfile(
                  onPressed: () {
                    Get.to(FavoriteScreen());
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
                      _auth.signOut();
                      Get.offAll(LoginScreen());
                    },
                    textColor: textColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
