import 'package:ebus/constant/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/sign_up_screen_controller.dart';

class SignUpDialog {
  static showDialogOtp(
      {required SignUpScreenController controller, required String contact}) {
    Get.dialog(AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 30.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Code sent to",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            Text(
              "$contact",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              alignment: Alignment.center,
              child: OtpTextField(
                fieldWidth: 10.w,
                margin: EdgeInsets.all(0.5.w),
                numberOfFields: 6,
                focusedBorderColor: AppColor.mainColors,
                borderColor: AppColor.mainColors,
                disabledBorderColor: AppColor.mainColors,
                enabledBorderColor: AppColor.mainColors,
                fillColor: AppColor.mainColors,
                showFieldAsBox: true,
                textStyle: const TextStyle(
                  fontSize: 10,
                ),
                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) async {
                  Get.back();
                  PhoneAuthCredential phoneAuthCredential =
                      await PhoneAuthProvider.credential(
                          verificationId: controller.verifIDReceived,
                          smsCode: verificationCode);

                  controller.signInWithPhoneAuthCredential(phoneAuthCredential);
                }, // end onSubmit
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
