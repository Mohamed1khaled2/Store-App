import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/signup_controller.dart';
import 'package:store/core/constant/images_asset.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_from_field.dart';

// ignore: camel_case_types
class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(text: 'Sign Up') , 
      body: GetBuilder<SignupControllerImp>(builder: (controller) {
        return ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  // Image
                  Image.asset(
                    AppImagesAsset.signup,
                    height: 260,
                  ),
                 
                 // fName , lName
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 180,
                          height: 65,
                          child: textFormFieldNormaill(
                              controller: controller.fname,
                              hintname: "Enter your first name",
                              label: "First Name")),
                      SizedBox(
                          width: 180,
                          height: 65,
                          child: textFormFieldNormaill(
                              controller: controller.lname,
                              hintname: "Enter your last name",
                              label: "Last Name"))
                    ],
                  ),
                  
                  const SizedBox(height: 10),
                  // email filed
                  textFormfiledEmail(controller: controller.email),
                  
                  const SizedBox(height: 15),
                 
                  // password filed
                  textFormFiledPassword(controller: controller.password),
                  
                  const SizedBox(height: 15),
                  
                  // re password filed
                  textFormFiledPassword(
                      hintname: "Enter your re-password",
                      label: "re-password",
                      controller: controller.repassword),
                  const SizedBox(height: 25),
                  //Elevated button SignUp
                  SizedBox(
                      height: 45,
                      width: 255,
                      child: elevatedButton(
                          text: "Sign Up", radius: 25, onpressed: () {})),
                  const SizedBox(height: 5),

                  // Social Media Auth
                  socialmediaSignInAndSignup(onpressedTwiiter: () {
                    controller.signinWithTwitter();
                  }, onpressedFacebook: () {
                    controller.signinWithFacebook();
                  }, onpressedgoogle: () {
                    controller.signinWithGoogle();
                  }),
                ],
              ),
            ),
          )
        ]);
      }),
    );
  }
}
