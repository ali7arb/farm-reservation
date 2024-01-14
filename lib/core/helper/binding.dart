import 'package:get/get.dart';
import 'package:reservation_farm/features/profile_screen/auth/profile_view_controller.dart';

import '../../features/home_screen/auth/calender_controller.dart';
import '../../features/home_screen/auth/home_view_controller.dart';
import '../../features/login_screen/auth/auth_login_controller.dart';
import 'local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthLogin());
    Get.lazyPut(() => HomeViewController());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewController());
    Get.lazyPut(() => CalenderController());
  }
}
