import 'package:get/get.dart';
import 'package:store/core/services/firebase_services.dart';

abstract class Main extends GetxController {
  signout();
}

class Mainimp extends Main {
  @override
  signout() {
    AuthController.instance.logout();
  }
}
