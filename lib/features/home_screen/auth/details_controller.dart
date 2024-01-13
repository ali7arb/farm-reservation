import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  late final PageController pageController;
  var currentPage = 0.obs;
  var imageCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
  }

  void updateImageCount(List<String>? images) {
    if (images != null) {
      imageCount.value = images.length;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
