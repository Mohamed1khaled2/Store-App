import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';

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
    Get.put(AuthController());

    super.onInit();
  }

  @override
  signinWithGoogle() async {
    await AuthController.instance.signInWithGoogle();
    Get.offAllNamed(AppRouteName.main);

  }

  bool isShowPassword = true;

  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signinWithFacebook() {}

  @override
  signinWithTwitter() {}

  @override
  signUp() {
    Get.toNamed(AppRouteName.signup);
  }

  @override
  forgotPassword() {
    Get.toNamed(AppRouteName.forgottenpasswordscreen);
    Get.delete();
  }

  @override
  sighin() async {
    if (keyform.currentState!.validate()) {
      AuthController.instance
          .login(email: email.text.trim(), password: password.text.trim());
    }
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
