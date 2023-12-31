import 'package:farms_reservation/features/login_screen/auth/auth_login_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthLogin());
  }
}
