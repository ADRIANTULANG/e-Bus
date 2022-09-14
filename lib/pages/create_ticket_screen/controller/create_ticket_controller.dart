import 'package:ebus/pages/create_ticket_screen/api/create_ticket_api.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../model/create_ticket_model.dart';

class CreateTicketController extends GetxController {
  RxList<CreateTicketBusPointsModel> buspointsList =
      <CreateTicketBusPointsModel>[].obs;

  RxString origin = "".obs;
  RxString destination = "".obs;
  RxString originID = "".obs;
  RxString destinationID = "".obs;

  RxDouble farePerkilo = 0.0.obs;

  RxDouble fareTotalAmount = 0.0.obs;

  RxDouble origin_lat = 0.0.obs;
  RxDouble origin_long = 0.0.obs;
  RxDouble destination_lat = 0.0.obs;
  RxDouble destination_long = 0.0.obs;

  @override
  void onInit() {
    getBusPoints();
    getFareAmountValue();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBusPoints() async {
    var result = await CreateTicketApi.getPoints();
    buspointsList.assignAll(result);
  }

  getFareAmountValue() async {
    var result = await CreateTicketApi.getFareAmountValue();
    if (result.length != 0) {
      farePerkilo.value = double.parse(result[0].fareAmount);
    }
  }

  calculateDistance(lat1, lon1, lat2, lon2) async {
    var distanceInMeters =
        await (Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000);
    print(distanceInMeters.toString() + "Kilometers");
    fareTotalAmount.value = distanceInMeters * farePerkilo.value;
  }

  createTicket() async {
    DateTime d = DateTime.now();
    String year = d.year.toString();
    String month = d.month.toString();
    String date = d.day.toString();
    if (month.length == 1) {
      month = "0" + month;
    }
    if (date.length == 1) {
      date = "0" + date;
    }
    String finalDateFormat = year + "-" + month + "-" + date;
    bool isSuccess = await CreateTicketApi.createTicket(
        trans_origin_id: originID.value.toString(),
        trans_destination_id: destinationID.value.toString(),
        trans_fare_amount: fareTotalAmount.value.toStringAsFixed(2),
        trans_date_created: finalDateFormat);
    if (isSuccess == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Successfully Created",
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
