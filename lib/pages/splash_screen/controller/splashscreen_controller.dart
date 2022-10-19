import 'dart:async';

import 'package:ebus/services/storage_services.dart';
import 'package:get/get.dart';

import '../../admin_home_sreen/view/admin_home_view.dart';
import '../../conductors_home_screen/view/conductors_home_view.dart';
import '../../home_screen/view/home_screen_view.dart';
import '../../login_screen/view/login_screen_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateTimer();
    super.onInit();
  }

  navigateTimer() {
    Timer(Duration(seconds: 10), () {
      if (Get.find<StorageServices>().storage.read('userID') != null) {
        if (Get.find<StorageServices>().storage.read('usertype') ==
            "Passenger") {
          Get.offAll(() => HomeScreenView());
        } else if (Get.find<StorageServices>().storage.read('usertype') ==
            "Admin") {
          Get.offAll(() => AdminHomeView());
        } else if (Get.find<StorageServices>().storage.read('usertype') ==
            "Conductor") {
          Get.offAll(() => ConductorsHomeView());
        }
      } else {
        Get.offAll(() => LoginScreenView());
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
