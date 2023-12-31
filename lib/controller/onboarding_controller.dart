import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/services.dart';
import 'package:store/data/datasource/static/static.dart';

// onBoarding Controller
abstract class OnboardingController extends GetxController {
  nextPageview();

  onPageChanged(int index);

  skip();

  getString();
}

class OnBoardingControllerImp extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();

  //NextToPage
  @override
  nextPageview() async {
    currentPage++;

    
    if (currentPage < onBoardingList.length ) {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 650), curve: Curves.easeInOut);
    } else {

      // will save String is new user after finish all on boarding Screen
      myServices.sharedPreferences.setString("isNewUser", "yes");

    
      await Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRouteName.login);
      });
    }
  }

  //Skip pages
  @override
  skip() {
    currentPage = onBoardingList.length - 1;
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

  @override
  getString() {
    if (currentPage == 0) {
      return "9".tr;
    } else if (currentPage == onBoardingList.length - 1) {
      return "12".tr;
    } else {
      return "11".tr;
    }
  }
}
