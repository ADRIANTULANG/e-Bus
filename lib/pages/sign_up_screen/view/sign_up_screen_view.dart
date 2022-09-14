import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpScreenController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register as",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  letterSpacing: 1.5),
            ),
            Text(
              "Passenger now!",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Username",
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
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
                  controller.createAccount();
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
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
