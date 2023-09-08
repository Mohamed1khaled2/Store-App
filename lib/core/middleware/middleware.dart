import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/services.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? cheak = myServices.sharedPreferences.getString("isNewUser");
    print("$cheak form middleware");
    if (cheak == "yes") {
      return const RouteSettings(name: AppRouteName.login);
    }
  }
}
