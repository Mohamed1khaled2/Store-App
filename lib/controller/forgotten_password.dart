import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';

import '../view/widgets/snack_bar.dart';

abstract class ForgottenPassword extends GetxController {
  search();
}

class ForgottenPasswordImp extends ForgottenPassword {
  late GlobalKey<FormState> key;
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    key = GlobalKey<FormState>();

    super.onInit();
  }

  @override
  search() {
    if (key.currentState!.validate()) {
      AuthController.instance.forgetPassword(email: email.text.trim());
      email.clear();
      Get.showSnackbar(
          messageSnackBar(
              messagetitle: "sent message" , messagetext: "Check your email" , messagetitlecolor: AppColors.primaryColor) );
    } else {}
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
