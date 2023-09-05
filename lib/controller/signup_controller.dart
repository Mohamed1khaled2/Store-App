import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class SignupController extends GetxController {
  signUp();
  signinWithGoogle();
  signinWithFacebook();
  signinWithTwitter();
  alreadyihaveAccount();
}

class SignupControllerImp extends SignupController {
  late GlobalKey<FormState> key;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fname;
  late TextEditingController lname;
  late TextEditingController repassword;
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
  signUp() {
    if (key.currentState!.validate()) {
      Get.offAndToNamed(AppRouteName.verfication);
    } else {
      // ('Vaild');print
    }
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
