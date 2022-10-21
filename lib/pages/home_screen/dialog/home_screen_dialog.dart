import 'package:ebus/pages/login_screen/view/login_screen_view.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/home_Screen_controller.dart';

class HomeScreenDialog {
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

  static showDialogForBalance({required HomeScreenController controller}) {
    controller.balanceText.text = 0.0.toString();
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 35.h,
        width: 90.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Top up Balance",
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            child: QrImage(
              padding: EdgeInsets.all(1.w),
              data: Get.find<StorageServices>().storage.read('pasId'),
              version: QrVersions.auto,
              size: 170.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          // Text(
          //   "Add Balance",
          //   style: TextStyle(
          //       fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          // ),
          // Container(
          //   // padding: EdgeInsets.only(left: 5.w, right: 5.w),
          //   height: 6.5.h,
          //   width: 100.w,
          //   child: TextField(
          //     controller: controller.balanceText,
          //     obscureText: false,
          //     keyboardType: TextInputType.number,
          //     inputFormatters: [
          //       FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
          //     ],
          //     decoration: InputDecoration(
          //       border:
          //           OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 2.h,
          // ),
          // InkWell(
          //   onTap: () {
          //     // controller.updatePercentageAndFare();
          //     if (controller.balanceText.text.isEmpty ||
          //         double.parse(controller.balanceText.text) == 0.0 ||
          //         double.parse(controller.balanceText.text) == 0) {
          //       Get.snackbar(
          //         "Message",
          //         "Please add amount to top up.",
          //         colorText: Colors.white,
          //         backgroundColor: AppColor.mainColors,
          //         snackPosition: SnackPosition.TOP,
          //       );
          //     } else {
          //       Get.back();
          //       Get.to(() => HomescreenPaymentOptions());
          //     }
          //   },
          //   child: Container(
          //     height: 6.5.h,
          //     width: 100.w,
          //     decoration: BoxDecoration(
          //         color: AppColor.mainColors,
          //         borderRadius: BorderRadius.circular(5),
          //         border: Border.all()),
          //     alignment: Alignment.center,
          //     child: Text(
          //       "Top up",
          //       style: TextStyle(
          //           fontSize: 15.sp,
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: 2),
          //     ),
          //   ),
          // )
        ]),
      ),
    ));
  }

  static showDialogForAccountUpdate(
      {required HomeScreenController controller}) {
    controller.name.text =
        Get.find<StorageServices>().storage.read('pasName').toString();
    controller.username.text =
        Get.find<StorageServices>().storage.read('pasUsername').toString();
    controller.password.text =
        Get.find<StorageServices>().storage.read('pasPassword').toString();
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 45.h,
        width: 90.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Account Settings",
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Name",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.name,
              obscureText: false,
              // keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
              // ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Username",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.username,
              obscureText: false,
              // keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
              // ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Password",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.password,
              obscureText: false,
              // keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
              // ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: () {
              // controller.updatePercentageAndFare();
              if (controller.name.text.isEmpty ||
                  controller.username.text.isEmpty ||
                  controller.password.text.isEmpty) {
                Get.snackbar(
                  "Message",
                  "Missing Input.",
                  colorText: Colors.white,
                  backgroundColor: AppColor.mainColors,
                  snackPosition: SnackPosition.TOP,
                );
              } else {
                controller.updateAccount();
              }
            },
            child: Container(
              height: 6.5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: AppColor.mainColors,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()),
              alignment: Alignment.center,
              child: Text(
                "UPDATE",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
