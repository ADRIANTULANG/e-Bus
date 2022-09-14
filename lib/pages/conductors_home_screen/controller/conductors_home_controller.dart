import 'package:ebus/pages/conductors_home_screen/api/conductors_list_api.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';

class ConductorsHomeController extends GetxController {
  RxString busPlateNo = "".obs;
  RxString busDriver = "".obs;

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    getBusDetails();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBusDetails() async {
    var result = await ConductorsHomeApi.getBusDetails();
    if (result.isNotEmpty) {
      busDriver.value = result[0].driver;
      busPlateNo.value = result[0].busplatenumber;
    }
  }

  updateConductorsAccount() async {
    bool isSuccess = await ConductorsHomeApi.updateConductorsAccount(
        con_name: name.text,
        con_username: username.text,
        con_pass: password.text);
    if (isSuccess == true) {
      Get.find<StorageServices>().saveConductorsCredentials(
          conId: Get.find<StorageServices>().storage.read("conId").toString(),
          conName: name.text,
          conUsername: username.text,
          conPass: password.text);
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Updated",
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
