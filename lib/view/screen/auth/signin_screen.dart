import 'package:flutter/material.dart';
import 'package:store/controller/login_controller.dart';
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
    Get.put(LoginControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      // Customze appBar
      appBar: appBar(text: 'Log in'),

      
      body: GetBuilder<LoginControllerImp>(builder: (controller) {
        return ListView(
          children: [
            Form(
              key: controller.key,
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
                    textFormFiledPassword(controller: controller.password),
                    Container(
                        margin: const EdgeInsets.only(left: 210),
                        child: textButton(
                            onpressed: () {
                              controller.forgotPassword();
                            },
                            text: "Forget Password")),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      width: 255,
                      child: elevatedButton(
                        radius: 25,
                        color: AppColors.primaryColor,
                        text: "Sign in",
                        onpressed: () async {
                          await controller.sighin();
                        },
                      ),
                    ),
                    //

                    socialmediaSignInAndSignup(onpressedTwiiter: () {
                      controller.signinWithTwitter();
                    }, onpressedFacebook: () {
                      controller.signinWithFacebook();
                    }, onpressedgoogle: () {
                      controller.signinWithGoogle();
                    }),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textButton(
                            onpressed: () {
                              controller.signUp();
                            },
                            text: "Sgin up")
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
