import 'package:ebus/pages/admin_home_sreen/model/admin_home_model.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../api/admin_home_screen_api.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:permission_handler/permission_handler.dart';

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
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    await getMonetizationAmountDevPercentage();
    await getMonetizationAmountFareValue();
    await getTickets();
    isLoading(false);
    super.onInit();
  }

  onRefresh() async {
    percentage.value = 0.0;
    fareValue.value = 0.0;
    developersEarnings.value = 0.0;
    totalFare.value = 0.0;
    await getMonetizationAmountDevPercentage();
    await getMonetizationAmountFareValue();
    await getTickets();
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

  void generateCsvFile() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses);
    // List<dynamic> associateList = [
    //   {"number": 1, "lat": "14.97534313396318", "lon": "101.22998536005622"},
    //   {"number": 2, "lat": "14.97534313396318", "lon": "101.22998536005622"},
    //   {"number": 3, "lat": "14.97534313396318", "lon": "101.22998536005622"},
    //   {"number": 4, "lat": "14.97534313396318", "lon": "101.22998536005622"}
    // ];
    List<dynamic> associateList = [];

    for (var i = 0; i < ticketsList.length; i++) {
      Map map = {
        "no": i,
        "ticketID": ticketsList[i].transId,
        "From": ticketsList[i].origin,
        "To": ticketsList[i].destination,
        "Passenger": ticketsList[i].pasName,
        "Driver": ticketsList[i].driver_name,
        "Con": ticketsList[i].con_name,
        "Bus": ticketsList[i].bus_plate_number,
        "Amount": ticketsList[i].transFareAmount,
      };
      associateList.add(map);
    }

    List<List<dynamic>> rows = [];

    List<dynamic> row = [];
    row.add("no");
    row.add("ticketID");
    row.add("From");
    row.add("To");
    row.add("Passenger");
    row.add("Driver");
    row.add("Con");
    row.add("Bus");
    row.add("Amount");
    rows.add(row);
    for (int i = 0; i < associateList.length; i++) {
      List<dynamic> row = [];
      row.add(associateList[i]["no"]);
      row.add(associateList[i]["ticketID"]);
      row.add(associateList[i]["From"]);
      row.add(associateList[i]["To"]);
      row.add(associateList[i]["Passenger"]);
      row.add(associateList[i]["Driver"]);
      row.add(associateList[i]["Con"]);
      row.add(associateList[i]["Bus"]);
      row.add(associateList[i]["Amount"]);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);

    var dir =
        (await getExternalStorageDirectories(type: StorageDirectory.documents))!
            .first;
    print("dir $dir");
    File newfile = File(await dir.path + "/" + "csv ${(DateTime.now())}.csv");

    newfile.writeAsString(csv);
    Get.defaultDialog(
        title: "Message",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        buttonColor: AppColor.mainColors,
        content: Container(
          padding: EdgeInsets.all(2.w),
          child: Text("Please take note that the CSV file was saved on $dir"),
        ));
  }
}
