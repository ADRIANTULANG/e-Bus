import 'package:ebus/pages/bus_list_screen/api/bus_list_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../model/bus_list_model.dart';

class BusListController extends GetxController {
  TextEditingController plateno = TextEditingController();
  RxList<busModel> busList = <busModel>[].obs;
  List<DriverModel> driversList = <DriverModel>[];
  RxBool isLoading = true.obs;

  RxString driverName = "Driver".obs;
  RxString driverID = "".obs;
  @override
  void onInit() async {
    await getBus();
    await getDrivers();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBus() async {
    var result = await BusListApi.getBus();
    busList.assignAll(result.reversed.toList());
  }

  onRefresh() async {
    await getDrivers();
  }

  getDrivers() async {
    var result = await BusListApi.getDrivers();
    driversList.assignAll(result);
  }

  createBus() async {
    bool isSuccess = await BusListApi.createBus(
        bus_plate_number: plateno.text, bus_driver_id: driverID.value);
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      getBus();
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
