import 'package:get/get.dart';
import '../../../features/auth/login/controller/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
