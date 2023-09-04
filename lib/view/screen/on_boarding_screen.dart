// ignore_for_file: camel_case_types
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/onboarding_controller.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/data/datasource/static/static.dart';
import 'package:store/view/widgets/big_text.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/small_text.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //PageView
            GetBuilder<OnBoardingControllerImp>(builder: (controller) {
              onpageChanged(value) {
                controller.onPageChanged(value);
              }
              return Expanded(
                flex: 3,
                
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: onpageChanged,
                  itemCount: onBoardingList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Title Text
                        bigText(text: onBoardingList[index].title!),

                        const SizedBox(height: 80),

                        // Image
                        Image.asset(onBoardingList[index].image!,
                            fit: BoxFit.fill, width: 200, height: 230),

                        const SizedBox(height: 80),

                        // Body Text
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            //body text
                            child: smallText(
                                text: onBoardingList[index].body!,
                                textAlign: TextAlign.center,
                                color: AppColors.bodyTextColor)),
                      ],
                    );
                  },
                ),
              );
            }),
           
            const SizedBox(height: 35),
           
            GetBuilder<OnBoardingControllerImp>(builder: (controller) {
              return Expanded(
                child: Column(
                  children: [
                    DotsIndicator(
                      dotsCount: onBoardingList.length,
                      position: controller.currentPage,
                      decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(25, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    elevatedButton(
                      width: 300,
                      height: 45,
                      onpressed: () {
                        controller.nextPageview();
                      },
                      text:
                          controller.currentPage == 0 ? "Les's go" : 'Continue',
                    ),
                    TextButton(
                      onPressed: () {
                        controller.skip();
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
