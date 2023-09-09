import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';
import 'package:store/core/services/services.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  String? cheack;

  @override
  RouteSettings? redirect(String? route) {
    cheack = myServices.sharedPreferences.getString("isNewUser");
    if (cheack == "yes") {
      if (AuthController.instance.auth.currentUser == null) {
        return const RouteSettings(name: AppRouteName.login);
      } else {
        return const RouteSettings(name: AppRouteName.main);
      }
    }else{
      //return const RouteSettings(name: AppRouteName.onboarding);
    }
    return null;
  }
}
