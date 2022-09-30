import 'package:ebus/pages/drivers_list_screen/api/drivers_list_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../model/driver_list_model.dart';

class DriversListController extends GetxController {
  RxList<DriverModel> driverList = <DriverModel>[].obs;
  TextEditingController drivername = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController address = TextEditingController();
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await getDrivers();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRefresh() async {
    getDrivers();
  }

  getDrivers() async {
    var result = await DriverListApi.getDrivers();
    driverList.assignAll(result.reversed.toList());
  }

  createDriver() async {
    bool isSuccess = await DriverListApi.createDriver(
      drivername: drivername.text,
      contact: contactno.text,
      address: address.text,
    );
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      getDrivers();
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
