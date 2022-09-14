import 'package:ebus/constant/color_class.dart';
import 'package:ebus/pages/login_screen/view/login_screen_view.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/admin_home_controller.dart';

class AdminHomeScreenDialog {
  static showDialogForMonetization({required AdminHomeController controller}) {
    controller.percentagetext.text = controller.percentage.value.toString();
    controller.farePerKmText.text = controller.fareValue.value.toString();
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 35.h,
        width: 90.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Monetization Settings",
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Dev. Percentage",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.percentagetext,
              obscureText: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
              ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Fare /Km.",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.farePerKmText,
              obscureText: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
              ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: InkWell(
              onTap: () {
                controller.updatePercentageAndFare();
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
                  "Update",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }

  static showDialogAccountSettings({required AdminHomeController controller}) {
    controller.adminName.text =
        Get.find<StorageServices>().storage.read('adminName').toString();
    controller.adminUsername.text =
        Get.find<StorageServices>().storage.read('adminUsername').toString();
    controller.adminPassword.text =
        Get.find<StorageServices>().storage.read('adminPassword').toString();
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 40.h,
        width: 90.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Account Setting",
            style: TextStyle(
                fontSize: 18.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.adminName,
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
            height: 1.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.adminUsername,
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
            height: 1.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.adminPassword,
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
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: InkWell(
              onTap: () {
                controller.updateAccount();
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
                  "Update",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }

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
}
