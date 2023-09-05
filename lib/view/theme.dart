import 'package:flutter/material.dart';
import 'package:store/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
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
    ));
ThemeData themeArabic =

 // You must chnage font 
 ThemeData(
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
    ));
