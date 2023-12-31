import 'package:flutter/material.dart';
import 'package:store/controller/signin_controller.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/core/constant/images_asset.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_button.dart';
import 'package:store/view/widgets/text_from_field.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class signInScreen extends StatelessWidget {
  const signInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigninControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      // Customze appBar
      appBar: appBar(text: "12".tr),

      body: GetBuilder<SigninControllerImp>(builder: (controller) {
        return ListView(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.keyform,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Image.asset(
                      AppImagesAsset.login,
                      height: 260,
                    ),
                    const SizedBox(height: 8),
                    textFormfiledEmail(controller: controller.email),
                    const SizedBox(height: 25),
                    textFormFiledPassword(
                      obscurebool: controller.isShowPassword,
                      ontapIconpassword: () {
                        controller.showpassword();
                      },
                      controller: controller.password,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 200),
                        child: textButton(
                            onpressed: () {
                              controller.forgotPassword();
                            },
                            text: "13".tr)),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      width: 255,
                      child: elevatedButton(
                        radius: 25,
                        color: AppColors.primaryColor,
                        text: "14".tr,
                        onpressed: () async {
                          await controller.sighin();
                        },
                      ),
                    ),
                    //

                    socialmediaSignInAndSignup(onpressedgoogle: (){
                      controller.signinWithGoogle();
                    }) ,
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "15".tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textButton(
                            onpressed: () {
                              controller.signUp();
                            },
                            text: "16".tr),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
