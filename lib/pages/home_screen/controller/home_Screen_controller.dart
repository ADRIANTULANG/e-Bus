import 'package:ebus/pages/home_screen/api/home_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constant/color_class.dart';
import '../../../services/storage_services.dart';
import '../model/home_screen_model.dart';

class HomeScreenController extends GetxController {
  RxList<PassengerTicketsModel> passengersTicketList =
      <PassengerTicketsModel>[].obs;
  TextEditingController balanceText = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxString ticketID = "".obs;
  RxString passengerName = "".obs;
  RxString origin = "".obs;
  RxString destination = "".obs;
  RxString fareAmount = "".obs;
  RxString status = "".obs;
  RxString dateCreated = "".obs;

  RxBool isCheckGcash = false.obs;
  RxBool isPaymaya = false.obs;
  RxBool isTopUpping = false.obs;

  RxString isSelectedPaymentGateway = "".obs;

  RxString passengerBalance = "0.0".obs;

  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await setBalance();
    isLoading(false);
    super.onInit();
  }

  setBalance() async {
    var result = await HomeScreenApi.getPassengerDetails(
        passengerID: Get.find<StorageServices>().storage.read('pasId'));
    if (result != [] || result != null) {
      passengerBalance.value =
          double.parse(result[0]['pas_balance']).toStringAsFixed(2);
      Get.find<StorageServices>()
          .storage
          .write('pasBalance', passengerBalance.value);
    }
    await getPassengersTickets();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRefresh() async {
    setBalance();
  }

  getPassengersTickets() async {
    var result = await HomeScreenApi.getPassengersTickets();
    passengersTicketList.assignAll(result.reversed.toList());
  }

  getTicketData({required String ticketID}) async {
    var result = await HomeScreenApi.getTicketDataResult(ticketID: ticketID);
    if (result.isNotEmpty) {
      dateCreated.value =
          DateFormat.yMMMEd().format(result[0].transDateCreated);
      passengerName.value = result[0].pasName;
      origin.value = result[0].origin;
      destination.value = result[0].destination;
      fareAmount.value = result[0].transFareAmount;
      status.value = result[0].transStatus;
    }
  }

  addAndUpdateBalance() async {
    double newBalance = double.parse(passengerBalance.value.toString()) +
        double.parse(balanceText.text);
    bool isSuccess = await HomeScreenApi.addAndUpdateBalance(
        newBalance: newBalance.toStringAsFixed(2));
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Thank you!",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      await Get.find<StorageServices>().savePassengerCredentials(
          pasId: Get.find<StorageServices>().storage.read('pasId'),
          pasName: Get.find<StorageServices>().storage.read('pasName'),
          pasUsername: Get.find<StorageServices>().storage.read('pasUsername'),
          pasPassword: Get.find<StorageServices>().storage.read('pasPassword'),
          pasBalance: newBalance.toString());
      setBalance();
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

  updateAccount() async {
    bool isSucces = await HomeScreenApi.updatePassengerAccount(
        pas_name: name.text,
        pas_username: username.text,
        pas_password: password.text);
    if (isSucces == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Updated",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      await Get.find<StorageServices>().savePassengerCredentials(
          pasId: Get.find<StorageServices>().storage.read('pasId'),
          pasName: name.text,
          pasUsername: username.text,
          pasPassword: password.text,
          pasBalance: Get.find<StorageServices>().storage.read('pasBalance'));
      setBalance();
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
