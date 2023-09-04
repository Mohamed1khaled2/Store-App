import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/screen/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store Demo',
      theme: ThemeData(
       
      ),
      home:const  onBoardingScreen(),
    );
  }
}


