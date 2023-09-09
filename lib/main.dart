import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/localization/change_local.dart';
import 'package:store/core/localization/translation.dart';
import 'package:store/core/services/firebase_services.dart';
import 'package:store/core/services/services.dart';
import 'package:store/firebase_options.dart';
import 'package:store/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 3) , (){
    FlutterNativeSplash.remove();
  });
  await initialServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
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
      theme: contrller.appTheme,
      getPages: AppRoutes.routes,
      initialRoute: AppRouteName.onboarding,
    );
  }
}
