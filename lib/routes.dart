import 'package:get/get_navigation/get_navigation.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/view/screen/auth/forgotten_password_screen.dart';
import 'package:store/view/screen/auth/reset_password_screen.dart';
import 'package:store/view/screen/auth/signin_screen.dart';
import 'package:store/view/screen/auth/signup_screen.dart';
import 'package:store/view/screen/auth/verfication_screen.dart';
import 'package:store/view/screen/main_screen.dart';
import 'package:store/view/screen/on_boarding_screen.dart';
class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: AppRouteName.onboarding, page: () => const onBoardingScreen()),
    GetPage(
        name: AppRouteName.login,
        page: () => const signInScreen(),
        transition: Transition.leftToRight),
    GetPage(name: AppRouteName.signup, page: () => const signUpScreen()),
    GetPage(
        name: AppRouteName.resetpassword,
        page: () => const ResetPasswordScreen()),
    GetPage(name: AppRouteName.verfication, page: () => const Verfication()),
    GetPage(
        name: AppRouteName.forgottenpasswordscreen,
        page: () => const ForgottenPasswordScreen(),
        transition: Transition.rightToLeft) , 
        GetPage(name: AppRouteName.main, page:()=>const MainScreen())
  ];
}
