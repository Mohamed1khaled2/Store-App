import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/datasource/static/static.dart';

abstract class OnboardingController extends GetxController {
  nextPageview();
  onPageChanged(int index);
  skip();
}

class OnBoardingControllerImp extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;

  @override
  nextPageview() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds:650), curve: Curves.easeInOut);
  }

  @override
  skip() {
    currentPage = onBoardingList.length;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 750), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
