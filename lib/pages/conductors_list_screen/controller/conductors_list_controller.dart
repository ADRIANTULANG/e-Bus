import 'package:ebus/pages/conductors_list_screen/api/conductors_list_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../model/conductors_list_model.dart';

class ConductorsListController extends GetxController {
  RxList<ConductorsModel> conductorsList = <ConductorsModel>[].obs;
  RxList<busModel> busList = <busModel>[].obs;

  TextEditingController conductorname = TextEditingController();
  TextEditingController conductorusername = TextEditingController();
  TextEditingController conductorpassword = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController address = TextEditingController();
  RxString busPlateno = "Plate no".obs;
  RxString busId = "".obs;
  @override
  void onInit() async {
    await getConductors();
    await getBus();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getConductors() async {
    var result = await ConductorsListApi.getConductors();
    conductorsList.assignAll(result.reversed.toList());
  }

  getBus() async {
    var result = await ConductorsListApi.getBus();
    busList.assignAll(result.reversed.toList());
  }

  createConductorAccount() async {
    bool isSuccess = await ConductorsListApi.createConductor(
        con_name: conductorname.text,
        con_username: conductorusername.text,
        con_pass: conductorpassword.text,
        con_address: address.text,
        con_contact: contactno.text,
        con_bus_id: busId.value);
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      getConductors();
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
