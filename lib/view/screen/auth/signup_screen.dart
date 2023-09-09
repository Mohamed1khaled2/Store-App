import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/signup_controller.dart';
import 'package:store/core/constant/images_asset.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_button.dart';
import 'package:store/view/widgets/text_from_field.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
      appBar: appBar(text: "Sign up"),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Image.asset(
            AppImagesAsset.signup,
            height: 260,
          ),
          GetBuilder<SignupControllerImp>(builder: (controller) {
            return Form(
              key: controller.key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textfilednormail(
                          labelText: "First Name",
                          textEditingController: controller.fname,
                          hintText: "Enter first name",
                          typetext: "First name"),
                      textfilednormail(
                          labelText: "Last Name",
                          textEditingController: controller.lname,
                          hintText: "Enter last name",
                          typetext: "Last name")
                    ],
                  ),
                  const SizedBox(height: 15),
                  // email filed
                  textFormfiledEmail(controller: controller.email),

                  const SizedBox(height: 15),

                  // password filed
                  textFormFiledPassword(
                      controller: controller.password,
                      obscurebool: controller.isShowPassword,
                      ontapIconpassword: () {
                        controller.showpassowrd();
                      }),

                  const SizedBox(height: 15),

                  // re password filed
                  textFormFiledPassword(
                    hintname: "Enter your re-password",
                    label: "Re-Password",
                    obscurebool: controller.isShowPassword,
                    controller: controller.repassword,
                    ontapIconpassword: () {
                      controller.showpassowrd();
                    },
                    typevalidator: "Re-Password",
                  ),
                  // Elevated button SignUp
                  const SizedBox(height: 15),
                  SizedBox(
                      height: 45,
                      width: 255,
                      child: elevatedButton(
                          text: "Sign Up",
                          radius: 25,
                          onpressed: () async {
                            await controller.signUp();
                          })),
                  const SizedBox(height: 5),
                  // Social Media Auth
                  socialmediaSignInAndSignup(onpressedgoogle: () {
                    controller.signinWithGoogle();
                  }),
                  textButton(
                      onpressed: () {
                        controller.alreadyihaveAccount();
                      },
                      text: "I already have account")
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
