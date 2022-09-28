import 'package:ebus/pages/qr_scanned_result/api/conductors_list_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';

class QrScannedController extends GetxController {
  RxString ticketID = "".obs;
  RxString passengerName = "".obs;
  RxString origin = "".obs;
  RxString destination = "".obs;
  RxString fareAmount = "".obs;
  RxString status = "".obs;
  RxBool isValid = false.obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    ticketID.value = await Get.arguments['ticketID'];
    print(ticketID.value);
    await getTicketData();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTicketData() async {
    var result = await QrCodeScannedResultApi.getTicketDataResult(
        ticketID: ticketID.value);
    if (result.isNotEmpty) {
      passengerName.value = result[0].pasName;
      origin.value = result[0].origin;
      destination.value = result[0].destination;
      fareAmount.value = result[0].transFareAmount;
      status.value = result[0].transStatus;
      if (status.value == "Valid") {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
    }
  }

  updateTicket() async {
    bool isSuccess =
        await QrCodeScannedResultApi.updateTicket(ticketID: ticketID.value);
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Approved",
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
