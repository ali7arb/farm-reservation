import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/auth/home_view_controller.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/farm_card.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/head_home_screen.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/search_farm.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';

import '../../../../core/utils/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .019,
                horizontal: MediaQuery.of(context).size.width * .019,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeadHomeScreen(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    const SearchFarm(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
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
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        itemCount: controller.farmModel.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
