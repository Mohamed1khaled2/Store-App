import 'package:flutter/material.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/view/screen/auth/signin_screen.dart';
import 'package:store/view/screen/auth/signup_screen.dart';
import 'package:store/view/screen/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) { // Login Screen
    return const signInScreen();
  } ,
  AppRoute.onboarding : (context){  // onboardingScreen
    return const onBoardingScreen();
  },
  AppRoute.signup :(context) => const signUpScreen() 
};
