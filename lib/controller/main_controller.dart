import 'package:get/get.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/firebase_services.dart';
import 'package:store/core/services/services.dart';
import 'package:store/view/widgets/snack_bar.dart';

abstract class Main extends GetxController {
  signout();

  getname();

  clickbro();
}

class Mainimp extends Main {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    myServices.sharedPreferences.setInt("SignIn", 1);
    // AuthController.instance.infoUser();
    super.onInit();
  }

  @override
  void onReady() {
    AuthController.instance.infoUser();

    super.onReady();
  }

  @override
  signout() {
    AuthController.instance.logout();
  }

  @override
  getname() {
    //Get name from firebase and show in mainPageScreen
    String? name = AuthController.instance.auth.currentUser!.displayName;
    return name;
  }

  @override
  clickbro() {
    Get.showSnackbar(messageSnackBar(
        messagetext: "Thanks sign in ",
        messagetitle: "Welcome bro",
        messagetitlecolor: AppColors.primaryColor));
  }
}
