import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../../../constant/peso_sign.dart';
import '../controller/home_Screen_controller.dart';

class HomescreenPaymentOptions extends GetView<HomeScreenController> {
  const HomescreenPaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Top up",
              style: TextStyle(
                fontSize: 24.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "now.!",
              style: TextStyle(
                fontSize: 24.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Please select payment options.",
              style: TextStyle(
                fontSize: 13.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.isCheckGcash.value,
                      onChanged: (value) {
                        if (controller.isCheckGcash.value == true) {
                          controller.isCheckGcash.value = false;
                          controller.isSelectedPaymentGateway.value = "";
                        } else {
                          controller.isCheckGcash.value = true;
                          controller.isSelectedPaymentGateway.value = "Gcash";
                        }
                        controller.isPaymaya.value = false;
                      }),
                ),
                Container(
                  height: 10.h,
                  child: Image.asset("assets/images/gcashlogo.png"),
                )
              ],
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.isPaymaya.value,
                      onChanged: (value) {
                        if (controller.isPaymaya.value == true) {
                          controller.isPaymaya.value = false;
                          controller.isSelectedPaymentGateway.value = "";
                        } else {
                          controller.isPaymaya.value = true;
                          controller.isSelectedPaymentGateway.value = "Paymaya";
                        }
                        controller.isCheckGcash.value = false;
                      }),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Container(
                  height: 8.h,
                  child: Image.asset("assets/images/paymaya.png"),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount:",
                  style: TextStyle(
                    fontSize: 13.sp,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$pesoSign ${controller.balanceText.text}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    letterSpacing: 1.5,
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => controller.isTopUpping.value == false
                  ? InkWell(
                      onTap: () {
                        if (controller.isCheckGcash.value == false &&
                            controller.isPaymaya.value == false) {
                          Get.snackbar(
                              "Message", "Please Select a Payment Options",
                              colorText: Colors.white,
                              backgroundColor: AppColor.mainColors,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 3));
                        } else {
                          // controller.createTicket();
                          // Get.back();
                          // Get.back();
                          // controller.updateClinicSubscription();
                          controller.addAndUpdateBalance();
                        }
                      },
                      child: Container(
                        height: 7.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 17.sp,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 7.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
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
