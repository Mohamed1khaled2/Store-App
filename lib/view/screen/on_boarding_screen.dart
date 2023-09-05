// ignore_for_file: camel_case_types
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/onboarding_controller.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/data/datasource/static/static.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_button.dart';

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
                        const SizedBox(height: 5),
                        Text(
                          onBoardingList[index].title!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 80),

                        // Image
                        Image.asset(onBoardingList[index].image!,
                            fit: BoxFit.fill, height: Get.width / 1.7),

                        const SizedBox(height: 90),

                        // Body Text
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            //body text
                            child: Text(
                              onBoardingList[index].body!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            )),
                      ],
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: 35),

            // Dots and elevatedButton
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
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: elevatedButton(
                        radius: 15,
                        color: AppColors.primaryColor,
                        onpressed: () {
                          controller.nextPageview();
                        },
                        text: controller.getString(),
                      ),
                    ),
                    textButton(
                      onpressed: () {
                        controller.skip();
                      },
                      text: '10'.tr,
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
