import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class ForgottenPassword extends GetxController {
  scerch();
}

class ForgottenPasswordImp extends ForgottenPassword {
  late GlobalKey<FormState> key;

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  scerch() {
    if (key.currentState!.validate()) {
      Get.offAndToNamed(AppRouteName.verfication);
    } else {}
  }
}
