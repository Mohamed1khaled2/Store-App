import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/core/localization/change_local.dart';
import 'package:store/core/localization/translation.dart';
import 'package:store/core/services/services.dart';
import 'package:store/routes.dart';
import 'package:store/view/screen/auth/signin_screen.dart';
import 'package:store/view/screen/language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalContrller contrller = Get.put(LocalContrller());
    return GetMaterialApp(
      locale: contrller.language,
      debugShowCheckedModeBanner: false,
      translations: Mytranslation(),
      title: 'Store Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo"),
          bodySmall: TextStyle(
            color: AppColors.bodyTextColor,
            height: 1.6,
            fontSize: 19,
          ),
        ),
      ),
      routes: routes,
      home: Builder(builder: (context) {
        MyServices myServices = Get.find();
        var asklanguage = myServices.sharedPreferences.get('lang');
        if (asklanguage == null) {
          return const languageScreen();
        } else {
          return const signInScreen();
        }
      }),
    );
  }
}
