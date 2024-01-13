import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/profile_screen/auth/profile_view_controller.dart';
import 'package:reservation_farm/features/profile_screen/presentation/views/widget/custom_clip_path.dart';
import 'package:reservation_farm/features/profile_screen/presentation/views/widget/custom_text_form_field.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custem_button_widget.dart';
import '../../../home_screen/presentation/views/widget/custem_text_name.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewController>(
        init: ProfileViewController(),
        builder: (controller) {
          controller.nameController.text = controller.userModel!.name!;
          controller.emailController.text = controller.userModel!.email!;
          controller.phoneController.text = controller.userModel!.phone!;

          var image = controller.profileImage;
          var networkImage = NetworkImage(controller.userModel?.pic ?? '');
          return SingleChildScrollView(
            child: Column(
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
                            CustemTextName(
                              name: controller.userModel?.name ?? '',
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: image == null
                              ? networkImage
                              : Image.file(image).image,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: IconButton(
                            onPressed: () {
                              controller.getProfileImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomFormField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                  text: 'Name',
                  validator: () {},
                  onSaved: () {},
                  icon: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  text: 'Email',
                  validator: () {},
                  onSaved: () {},
                  icon: Icons.email,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  text: 'phone',
                  validator: () {},
                  onSaved: () {},
                  icon: Icons.phone_android_outlined,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustemButtonWidget(
                    onPressed: () {
                      controller.updateUser(
                        name: controller.nameController.text,
                        phone: controller.phoneController.text,
                        email: controller.emailController.text,
                      );
                    },
                    title: 'Update',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
