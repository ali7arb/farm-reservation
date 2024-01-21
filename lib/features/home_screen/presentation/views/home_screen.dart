import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/auth/home_view_controller.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/farm_card.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/head_home_screen.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/search_farm.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';

import '../../../../core/utils/style.dart';
import '../../../login_screen/auth/auth_login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeViewController>(
        init: HomeViewController(),
        builder: (controller) => Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: backgroundHome,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .019,
                  horizontal: MediaQuery.of(context).size.width * .019,
                ),
                child: ConditionalBuilder(
                  condition: controller.farmModel.isNotEmpty ||
                      controller.farmModel.isEmpty,
                  builder: (context) {
                    AuthLogin authController = Get.put(AuthLogin());
                    return Column(
                      children: [
                        const HeadHomeScreen(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        const SearchFarm(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        if (authController.userModel?.isEmailVerified == false)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(.5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.warning,
                                      color: Colors.orange),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .001,
                                  ),
                                  const Text(
                                    'Please verify your email to access.',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              FarmModel farm = controller.farmModel[index];
                              return FarmCard(
                                farm: farm,
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            itemCount: controller.farmModel.length,
                          ),
                        ),
                      ],
                    );
                  },
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
