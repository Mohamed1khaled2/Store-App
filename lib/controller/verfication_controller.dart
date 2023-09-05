import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';

abstract class Verfication extends GetxController {
  yes();
  no();
}

class VerficationImp extends Verfication {
  @override
  no() {
    Get.offAllNamed(AppRouteName.main);
  }

  @override
  yes() {
    Get.offAndToNamed(AppRouteName.resetpassword);
  }
}
