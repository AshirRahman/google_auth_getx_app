import 'package:get/get.dart';
import '../../../features/auth/login/controller/google_auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GoogleAuthController());
  }
}
