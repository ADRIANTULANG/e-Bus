import 'package:ebus/pages/admin_home_sreen/model/admin_home_model.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/color_class.dart';
import '../api/admin_home_screen_api.dart';

class AdminHomeController extends GetxController {
  RxList<TicketsModel> ticketsList = <TicketsModel>[].obs;
  RxDouble percentage = 0.0.obs;
  RxDouble fareValue = 0.0.obs;
  RxDouble developersEarnings = 0.0.obs;
  RxDouble totalFare = 0.0.obs;
  TextEditingController percentagetext = TextEditingController();
  TextEditingController farePerKmText = TextEditingController();

  TextEditingController adminName = TextEditingController();
  TextEditingController adminUsername = TextEditingController();
  TextEditingController adminPassword = TextEditingController();

  @override
  void onInit() async {
    await getMonetizationAmountDevPercentage();
    await getMonetizationAmountFareValue();
    await getTickets();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getMonetizationAmountDevPercentage() async {
    var result = await AdminHomeApi.getMonetizationAmountDevPercentage();
    if (result.isNotEmpty) {
      percentage.value = double.parse(result[0].percentageValue) * 100;
    }
  }

  getMonetizationAmountFareValue() async {
    var result = await AdminHomeApi.getMonetizationAmountFareValue();
    if (result.isNotEmpty) {
      fareValue.value = double.parse(result[0].fareAmount);
    }
  }

  getTickets() async {
    var result = await AdminHomeApi.getTickets();
    ticketsList.assignAll(result.reversed.toList());
    getDevelopersEarnings();
  }

  getDevelopersEarnings() {
    for (var i = 0; i < ticketsList.length; i++) {
      var amount_to_add = double.parse(ticketsList[i].transFareAmount) *
          (percentage.value / 100);
      developersEarnings.value = developersEarnings.value + amount_to_add;
      totalFare.value =
          totalFare.value + double.parse(ticketsList[i].transFareAmount);
    }
  }
  //6 12 7.8 9

  updatePercentageAndFare() async {
    bool isSuccess = await AdminHomeApi.updatePercentageAndFare(
        percentage: (double.parse(percentagetext.text) / 100).toString(),
        fare: farePerKmText.text);
    if (isSuccess == true) {
      Get.back();
      getMonetizationAmountDevPercentage();
      getMonetizationAmountFareValue();
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
        "Sorry.. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  updateAccount() async {
    bool isSuccess = await AdminHomeApi.updateAccount(
        adminName: adminName.text,
        adminUsername: adminUsername.text,
        adminPassword: adminPassword.text);
    if (isSuccess == true) {
      Get.back();
      Get.find<StorageServices>().saveAdminCredentials(
          adminId: Get.find<StorageServices>().storage.read('adminId'),
          adminName: adminName.text,
          adminUsername: adminUsername.text,
          adminPassword: adminPassword.text);
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
        "Sorry.. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
