import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/localization/change_local.dart';
import 'package:store/view/widgets/elevated_button.dart';

// ignore: camel_case_types
class languageScreen extends GetView<LocalContrller> {
  const languageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 35),
            elevatedButton(
              radius: 15,
                text: "Ar",
                onpressed: () {
                  controller.changeLang("ar");
                  Get.offAllNamed(AppRoute.onboarding);
                },
                color: AppColors.primaryColor),
            const SizedBox(height: 25),
            elevatedButton(
              radius: 15,
                text: "En",
                onpressed: () {
                  controller.changeLang("en");
                  Get.offAllNamed(AppRoute.onboarding);
                },
                color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
