import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/home_screen.dart';
import 'package:reservation_farm/features/login_screen/auth/auth_login_controller.dart';
import 'package:reservation_farm/features/onboarding/onboarding_screen.dart';

class ControllerView extends GetWidget<AuthLogin> {
  const ControllerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthLogin>().user != null)
          ? const HomeScreen()
          : const OnboardingScreen();
    });
  }
}
