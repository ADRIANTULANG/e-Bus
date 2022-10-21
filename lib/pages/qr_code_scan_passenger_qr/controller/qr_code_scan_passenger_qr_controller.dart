import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../api/qr_code_scan_passenger_qr_api.dart';
import '../dialog/qr_code_scna_passenger_qr_dialog.dart';

class QRcodeScanPassengerController extends GetxController {
  TextEditingController newBalance = TextEditingController();
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  RxDouble passenger_current_balance = 0.0.obs;

  getPassengerDetails(
      {required String passengerID,
      required BuildContext context,
      required QRcodeScanPassengerController controller}) async {
    var passengerDetails = await QrCodePassengerScanApi.getPassengerDetails(
        passengerID: passengerID);
    if (passengerDetails != [] || passengerDetails != null) {
      passenger_current_balance.value =
          double.parse(passengerDetails[0]['pas_balance'].toString());
      QRcodeScanPassengerQrDialog.showDialogForBalance(
          context: context,
          controller: controller,
          currentBalance: passenger_current_balance.value,
          passengerID: passengerID);
    }
  }

  addAndUpdateBalance(
      {required double oldBalance,
      required double additionalBalance,
      required String passengerID}) async {
    double newBalance = oldBalance + additionalBalance;
    bool isSuccess = await QrCodePassengerScanApi.addAndUpdateBalance(
        passengerID: passengerID, newBalance: newBalance.toStringAsFixed(2));
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Thank you!",
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
