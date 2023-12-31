import 'package:farms_reservation/features/home_screen/widget/farm_card.dart';
import 'package:farms_reservation/features/home_screen/widget/head_home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utils/style.dart';
import 'widget/search_farm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: backgroundHome,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeadHomeScreen(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SearchFarm(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      itemBuilder: (context, index) => const FarmCard(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      itemCount: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
