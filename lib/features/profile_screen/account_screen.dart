import 'package:farms_reservation/core/widgets/custem_button_widget.dart';
import 'package:farms_reservation/features/home_screen/widget/custem_text_name.dart';
import 'package:farms_reservation/features/profile_screen/widget/custom_clip_path.dart';
import 'package:farms_reservation/features/profile_screen/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15),
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
                      const CustemTextName(
                        name: 'Ali Harb',
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CustomFormField(
            keyboardType: TextInputType.text,
            text: 'Name',
            validator: () {},
            onSaved: () {},
            icon: Icons.person,
          ),
          CustomFormField(
            keyboardType: TextInputType.number,
            text: 'Birthday',
            validator: () {},
            onSaved: () {},
            icon: Icons.calendar_month,
          ),
          CustomFormField(
            keyboardType: TextInputType.phone,
            text: 'phone',
            validator: () {},
            onSaved: () {},
            icon: Icons.phone_android_outlined,
          ),
          CustomFormField(
            keyboardType: TextInputType.emailAddress,
            text: 'Email',
            validator: () {},
            onSaved: () {},
            icon: Icons.email,
          ),
          CustomFormField(
            keyboardType: TextInputType.visiblePassword,
            text: 'password',
            validator: () {},
            onSaved: () {},
            icon: Icons.visibility,
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: CustemButtonWidget(
              title: 'Sign out',
            ),
          ),
        ],
      ),
    );
  }
}
