import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/core/services/services.dart';

class LocalContrller extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreflang = myServices.sharedPreferences.getString("lang");
    if (sharedPreflang == "ar") {
      language = const Locale("ar");
    } else if (sharedPreflang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
