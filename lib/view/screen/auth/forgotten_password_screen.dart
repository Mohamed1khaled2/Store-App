import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/forgotten_password.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_from_field.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  const ForgottenPasswordScreen({super.key});

  @override
  State<ForgottenPasswordScreen> createState() =>
      _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(ForgottenPasswordImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(text: ''),
      body: Center(
        child: GetBuilder<ForgottenPasswordImp>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(25),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.primaryColor,
                ),
                height: 300,
                width: 450,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Find Your Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "Please enter your email address to search for your account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 25),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: controller.key,
                        child: textFormfiledEmail(
                          controller: controller.email,
                          filled: true,
                          colorFilled: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 35),
                      elevatedButton(
                        text: "Screch",
                        radius: 25,
                        onpressed: () {
                          controller.search();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
