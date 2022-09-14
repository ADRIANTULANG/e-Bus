import 'package:ebus/constant/color_class.dart';
import 'package:ebus/pages/login_screen/view/login_screen_view.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/conductors_home_controller.dart';

class ConductorsHomeDialog {
  static showDialoglogOut() {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 15.h,
        width: 90.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you sure you want to log out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      )),
                  TextButton(
                      onPressed: () {
                        Get.find<StorageServices>().removeStorageCredentials();
                        Get.offAll(() => LoginScreenView());
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
            ]),
      ),
    ));
  }

  static showConductorsBusDetails(
      {required ConductorsHomeController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 15.h,
        width: 90.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Bus Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bus: ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  ),
                  Obx(
                    () => Text(
                      controller.busPlateNo.value,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Driver: ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  ),
                  Obx(
                    () => Text(
                      controller.busDriver.value,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
            ]),
      ),
    ));
  }

  static showConductorUpdateAccount(
      {required ConductorsHomeController controller}) {
    controller.name.text = Get.find<StorageServices>().storage.read("conName");
    controller.username.text =
        Get.find<StorageServices>().storage.read("conUsername");
    controller.password.text =
        Get.find<StorageServices>().storage.read("conPass");
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 46.h,
        width: 90.w,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Account Details",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
                Container(
                  height: 6.5.h,
                  width: 100.w,
                  child: TextField(
                    controller: controller.name,
                    obscureText: false,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
                Container(
                  height: 6.5.h,
                  width: 100.w,
                  child: TextField(
                    controller: controller.username,
                    obscureText: false,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
                Container(
                  height: 6.5.h,
                  width: 100.w,
                  child: TextField(
                    controller: controller.password,
                    obscureText: false,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    if (controller.name.text.isEmpty ||
                        controller.username.text.isEmpty ||
                        controller.password.text.isEmpty) {
                      Get.snackbar(
                        "Message",
                        "Missing Input!",
                        colorText: Colors.white,
                        backgroundColor: AppColor.mainColors,
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      controller.updateConductorsAccount();
                    }
                  },
                  child: Container(
                    height: 6.5.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColor.mainColors,
                        border: Border.all()),
                    alignment: Alignment.center,
                    child: Text(
                      "UPDATE",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ));
  }
}
