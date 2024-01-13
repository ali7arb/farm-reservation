import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/style.dart';
import '../../core/widgets/custem_button_widget.dart';
import '../home_screen/presentation/views/home_screen.dart';
import '../login_screen/presentation/views/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            gradient: gradientColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              CustemButtonWidget(
                title: 'User',
                textColor: const Color(0xFF222B45),
                onPressed: () {
                  Get.offAll(LoginScreen());
                },
              ),
              SizedBox(
                height: Get.height / 25,
              ),
              CustemButtonWidget(
                gradient: gradientColor3,
                textColor: const Color(0xff81D0F2),
                title: 'Guest',
                onPressed: () {
                  Get.offAll(
                    const HomeScreen(),
                  );
                },
              ),
              SizedBox(
                height: Get.height / 25,
              ),
              CustemButtonWidget(
                title: 'Owner',
                textColor: const Color(0xFF222B45),
                onPressed: () {
                  Get.offAll(
                    LoginScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
