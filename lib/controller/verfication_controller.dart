import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

import '../core/services/firebase_services.dart';
import '../core/services/services.dart';
import 'dart:developer' as dev show log;

abstract class Verfication extends GetxController {
  signOut();

  resentemail();
}

class VerficationImp extends Verfication {
  bool isEmailVerified = false;
  Timer? timer;
  MyServices myServices = Get.find();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    isEmailVerified = AuthController.instance.auth.currentUser!.emailVerified;
    // on Init cheack email verified

    if (!isEmailVerified) {
      AuthController.instance.sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => cheackemailverfiied(),
      );
    }
    super.onInit();
  }

  Future cheackemailverfiied() async {
    if (AuthController.instance.auth.currentUser != null) {
      dev.log('relod');
      await AuthController.instance.auth.currentUser!.reload();
      isEmailVerified = AuthController.instance.auth.currentUser!.emailVerified;
      if (isEmailVerified) {
        timer?.cancel();
        Get.offAllNamed(AppRouteName.main);
      }
    } else {}
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Future resentemail() async {
    Get.showSnackbar(const GetSnackBar(
        maxWidth: 250,
        borderRadius: 25,
        duration: Duration(seconds: 5),
        isDismissible: false,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Please waiting..",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        messageText: Text(
          "We are send verification code after 10 seconds ",
          style: TextStyle(fontSize: 19, color: Colors.white),
        )));

    Future.delayed(
      const Duration(seconds: 10),
      () async {
        //Sent email verified after 10 seconds
        await AuthController.instance.sendVerificationEmail();
      },
    );
  }

  @override
  signOut() {
    AuthController.instance.logout();
    myServices.sharedPreferences.remove("IsEmailVerified");
  }
}
