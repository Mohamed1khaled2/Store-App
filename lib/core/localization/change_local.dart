import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/core/services/services.dart';
import 'package:store/view/theme.dart';

class LocalContrller extends GetxController {
  Locale? language;
  Locale? newUwer;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    appTheme = languageCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }



  @override
  void onInit() {
    SharedPreferences shared = myServices.sharedPreferences;
    String? sharedlanguage = shared.getString("lang");
    if (sharedlanguage == "ar") {
      appTheme = themeArabic;
      language = const Locale("ar");
    } else if (sharedlanguage == "en") {
      appTheme = themeEnglish;
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
