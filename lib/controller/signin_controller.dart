import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class SigninController extends GetxController {
  sighin();
  forgotPassword();
  signUp();
  signinWithGoogle();
  signinWithFacebook();
  signinWithTwitter();
}

class SigninControllerImp extends SigninController {
  late GlobalKey<FormState> keyform;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    keyform = GlobalKey();
    password = TextEditingController();
    email = TextEditingController();

    super.onInit();
  }

  @override
  signinWithGoogle() {}

  @override
  signinWithFacebook() {}

  @override
  signinWithTwitter() {}

  @override
  signUp() {
    Get.offNamed(AppRouteName.signup);
  }

  @override
  forgotPassword() {
    Get.toNamed(AppRouteName.forgottenpasswordscreen);
  }

  @override
  sighin() {
    if (keyform.currentState!.validate()) {
      Get.offAllNamed(AppRouteName.main);
    }
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
