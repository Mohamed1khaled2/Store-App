import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';
import 'package:store/core/services/services.dart';
import 'package:store/view/widgets/snack_bar.dart';

abstract class SignupController extends GetxController {
  signUp();
  signinWithGoogle();
  signinWithFacebook();
  signinWithTwitter();
  alreadyihaveAccount();
}

class SignupControllerImp extends SignupController {
  late GlobalKey<FormState> key;
  late final TextEditingController email;
  late final TextEditingController password;
  late TextEditingController fname;
  late TextEditingController lname;
  late TextEditingController repassword;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    key = GlobalKey();
    password = TextEditingController();
    email = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  signUp() async {
    if (key.currentState!.validate()) {
      if (repassword.text == password.text) {
        AuthController.instance
            .register(email.text, password.text.trim(), fname.text.trim());
      } else {
        Get.showSnackbar(
            getsnackbarwrong(messagetext: "re-password Not equal password"));
      }
    }
  }

  bool isShowPassword = true;

  showpassowrd() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signinWithGoogle() {}

  @override
  signinWithFacebook() {}

  @override
  signinWithTwitter() {}
  @override
  void dispose() {
    fname.dispose();
    email.dispose();
    lname.dispose();
    repassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  alreadyihaveAccount() {
    Get.offNamed(AppRouteName.login);
  }
}
