import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class SignupController extends GetxController {
  signUp();
  signinWithGoogle();
  signinWithFacebook();
  signinWithTwitter();
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
    Get.toNamed(AppRoute.signup);
  }

  @override
  signinWithGoogle() {}

  @override
  signinWithFacebook() {}

  @override
  signinWithTwitter() {
    throw UnimplementedError();
  }
}
