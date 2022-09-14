import 'package:ebus/pages/login_screen/api/login_screen_api.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../../admin_home_sreen/view/admin_home_view.dart';
import '../../conductors_home_screen/view/conductors_home_view.dart';
import '../../home_screen/view/home_screen_view.dart';
import '../model/login_screen_model.dart';

class LoginScreenController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isGettingCredentials = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    isGettingCredentials(true);
    List<UserAccountModel> userAccount = await LoginScreenApi.getUserAccount(
        username: username.text, password: password.text);
    if (userAccount.isNotEmpty) {
      await Get.find<StorageServices>().saveCredentials(
          userID: userAccount[0].userId,
          username: userAccount[0].username,
          password: userAccount[0].password,
          usertype: userAccount[0].usertype,
          createAt: userAccount[0].createAt.toString(),
          accountId: userAccount[0].accountId);
      if (userAccount[0].usertype == "Passenger") {
        List<PassengerAccountModel> passengerData =
            await LoginScreenApi.getPassengerDetails(
                accountID: userAccount[0].accountId);
        await Get.find<StorageServices>().savePassengerCredentials(
            pasId: passengerData[0].pasId,
            pasName: passengerData[0].pasName,
            pasUsername: passengerData[0].pasUsername,
            pasPassword: passengerData[0].pasPassword,
            pasBalance: passengerData[0].pasBalance);
        Get.to(() => HomeScreenView());
      } else if (userAccount[0].usertype == "Admin") {
        List<AdminAccountModel> adminAccount =
            await LoginScreenApi.getAdminDetails(
                accountID: userAccount[0].accountId);
        await Get.find<StorageServices>().saveAdminCredentials(
            adminId: adminAccount[0].adminId,
            adminName: adminAccount[0].adminName,
            adminUsername: adminAccount[0].adminUsername,
            adminPassword: adminAccount[0].adminPassword);
        Get.to(() => AdminHomeView());
      } else if (userAccount[0].usertype == "Conductor") {
        List<ConductorAccountModel> conductorsAccount =
            await LoginScreenApi.getConductorsDetails(
                accountID: userAccount[0].accountId);
        await Get.find<StorageServices>().saveConductorsCredentials(
            conId: conductorsAccount[0].conId,
            conName: conductorsAccount[0].conName,
            conUsername: conductorsAccount[0].conUsername,
            conPass: conductorsAccount[0].conPass);
        Get.to(() => ConductorsHomeView());
      } else {
        Get.snackbar(
          "Message",
          "Sorry.. User did not exist!",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.BOTTOM,
        );
        await Get.find<StorageServices>().removeStorageCredentials();
      }
    } else {
      await Get.find<StorageServices>().removeStorageCredentials();
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isGettingCredentials(false);
  }
}
