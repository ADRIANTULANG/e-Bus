import 'package:ebus/pages/sign_up_screen/api/sign_up_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';

class SignUpScreenController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createAccount() async {
    bool isSucces = await SignUpScreenApi.createPassenger(
        pas_name: name.text,
        pas_username: username.text,
        pas_password: password.text);
    if (isSucces == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Account Successfully Created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
