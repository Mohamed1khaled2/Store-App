import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class LoginController extends GetxController {
  sighin();
  forgotPassword();
  signUp();
  signinWithGoogle();
  signinWithFacebook();
  signinWithTwitter();
}

class LoginControllerImp extends LoginController {
  late GlobalKey<FormState> key;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    key = GlobalKey();
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
    Get.toNamed(AppRoute.signup);
  }

  @override
  forgotPassword() {}

  @override
  sighin() {}
}
