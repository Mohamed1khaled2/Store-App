import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';

abstract class SigninController extends GetxController {
  sighin();
  forgotPassword();
  signUp();
  signinWithGoogles();
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
  signinWithGoogles() async {
    await AuthController.instance.signInWithGoogle();
  }

  bool isShowPassword = true;

  showpassowrd() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

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
  sighin() async {
    if (keyform.currentState!.validate()) {
      AuthController.instance.login(email.text.trim(), password.text.trim());
    }
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
