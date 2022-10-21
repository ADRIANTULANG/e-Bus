import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/qr_code_scan_passenger_qr_controller.dart';

class QRcodeScanPassengerQrDialog {
  static showDialogForBalance(
      {required QRcodeScanPassengerController controller,
      required BuildContext context,
      required double currentBalance,
      required String passengerID}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 25.h,
        width: 90.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Text(
            "Add Balance",
            style: TextStyle(
                fontSize: 9.sp, fontWeight: FontWeight.w400, letterSpacing: 2),
          ),
          Container(
            // padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 6.5.h,
            width: 100.w,
            child: TextField(
              controller: controller.newBalance,
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
          InkWell(
            onTap: () async {
              FocusScope.of(context).unfocus();
              // controller.updatePercentageAndFare();
              if (controller.newBalance.text.isEmpty ||
                  double.parse(controller.newBalance.text) == 0.0 ||
                  double.parse(controller.newBalance.text) == 0) {
                Get.snackbar(
                  "Message",
                  "Please add amount to top up.",
                  colorText: Colors.white,
                  backgroundColor: AppColor.mainColors,
                  snackPosition: SnackPosition.TOP,
                );
              } else {
                Get.back();
                await controller.addAndUpdateBalance(
                    oldBalance: currentBalance,
                    additionalBalance: double.parse(controller.newBalance.text),
                    passengerID: passengerID);
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
                "Top up",
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
