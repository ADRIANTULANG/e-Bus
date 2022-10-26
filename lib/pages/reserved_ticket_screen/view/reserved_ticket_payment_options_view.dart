import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../../../constant/peso_sign.dart';
import '../../home_screen/controller/home_Screen_controller.dart';
import '../controller/reserved_ticket_controller.dart';

class ReservedTicketPaymentOptions extends GetView<ReservedTicketController> {
  const ReservedTicketPaymentOptions({Key? key}) : super(key: key);

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
              "Reserve your",
              style: TextStyle(
                fontSize: 24.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Ticket now.!",
              style: TextStyle(
                fontSize: 24.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "From: ",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 12.sp,
            //           letterSpacing: 1.5),
            //     ),
            //     Text(
            //       controller.origin.value,
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 12.sp,
            //           letterSpacing: 1.5),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Row(
            //   children: [
            //     Text(
            //       "To: ",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 12.sp,
            //           letterSpacing: 1.5),
            //     ),
            //     Text(
            //       controller.destination.value,
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 12.sp,
            //           letterSpacing: 1.5),
            //     ),
            //   ],
            // ),
            // Text(
            //   "Please select payment options.",
            //   style: TextStyle(
            //     fontSize: 13.sp,
            //     letterSpacing: 1.5,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            // SizedBox(
            //   height: 4.h,
            // ),
            // Row(
            //   children: [
            //     Obx(
            //       () => Checkbox(
            //           value: controller.isCheckGcash.value,
            //           onChanged: (value) {
            //             if (controller.isCheckGcash.value == true) {
            //               controller.isCheckGcash.value = false;
            //               controller.isSelectedPaymentGateway.value = "";
            //             } else {
            //               controller.isCheckGcash.value = true;
            //               controller.isSelectedPaymentGateway.value = "Gcash";
            //             }
            //             controller.isPaymaya.value = false;
            //             controller.isEwallet.value = false;
            //           }),
            //     ),
            //     Container(
            //       height: 10.h,
            //       child: Image.asset("assets/images/gcashlogo.png"),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Obx(
            //       () => Checkbox(
            //           value: controller.isPaymaya.value,
            //           onChanged: (value) {
            //             if (controller.isPaymaya.value == true) {
            //               controller.isPaymaya.value = false;
            //             } else {
            //               controller.isPaymaya.value = true;
            //             }
            //             controller.isCheckGcash.value = false;
            //             controller.isEwallet.value = false;
            //           }),
            //     ),
            //     SizedBox(
            //       width: 7.w,
            //     ),
            //     Container(
            //       height: 8.h,
            //       child: Image.asset("assets/images/paymaya.png"),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Obx(
            //       () => Checkbox(
            //           value: controller.isEwallet.value,
            //           onChanged: (value) {
            //             if (controller.isEwallet.value == true) {
            //               controller.isEwallet.value = false;
            //             } else {
            //               controller.isEwallet.value = true;
            //             }
            //             controller.isCheckGcash.value = false;
            //             controller.isPaymaya.value = false;
            //           }),
            //     ),
            //     SizedBox(
            //       width: 7.w,
            //     ),
            //     Container(
            //       height: 8.h,
            //       alignment: Alignment.center,
            //       child: Text(
            //         "E-Wallet",
            //         style: TextStyle(
            //           fontSize: 18.sp,
            //           letterSpacing: 1.5,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
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
                Obx(
                  () => Text(
                    "$pesoSign ${controller.fareTotalAmount.value.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 13.sp,
                      letterSpacing: 1.5,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => controller.isSubscribing.value == false
                  ? InkWell(
                      onTap: () {
                        var amount = double.parse(
                                Get.find<HomeScreenController>()
                                    .passengerBalance
                                    .value) -
                            controller.fareTotalAmount.value;
                        if (amount < 0) {
                          Get.snackbar("Message", "Not enough balance",
                              colorText: Colors.white,
                              backgroundColor: AppColor.mainColors,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 3));
                        } else {
                          Get.find<StorageServices>()
                              .storage
                              .write("pasBalance", amount.toStringAsFixed(2));
                          Get.find<HomeScreenController>().setBalance();
                          controller.updateBalance(
                              newbalance: amount.toStringAsFixed(2));
                          controller.createTicket();
                        }
                        // if (controller.isCheckGcash.value == false &&
                        //     controller.isEwallet.value == false &&
                        //     controller.isPaymaya.value == false) {
                        //   Get.snackbar(
                        //       "Message", "Please Select a Payment Options",
                        //       colorText: Colors.white,
                        //       backgroundColor: AppColor.mainColors,
                        //       snackPosition: SnackPosition.TOP,
                        //       duration: Duration(seconds: 3));
                        // } else {
                        //   var amount = double.parse(
                        //           Get.find<HomeScreenController>()
                        //               .passengerBalance
                        //               .value) -
                        //       controller.fareTotalAmount.value;
                        //   if (controller.isEwallet.value == true) {
                        //     if (amount < 0) {
                        //       Get.snackbar("Message", "Not enough balance",
                        //           colorText: Colors.white,
                        //           backgroundColor: AppColor.mainColors,
                        //           snackPosition: SnackPosition.TOP,
                        //           duration: Duration(seconds: 3));
                        //     } else {
                        //       Get.find<StorageServices>().storage.write(
                        //           "pasBalance", amount.toStringAsFixed(2));
                        //       Get.find<HomeScreenController>().setBalance();
                        //       controller.updateBalance(
                        //           newbalance: amount.toStringAsFixed(2));
                        //       controller.createTicket();
                        //     }
                        //   } else {
                        //     controller.createTicket();
                        //   }

                        //   // Get.back();
                        //   // Get.back();
                        //   // controller.updateClinicSubscription();
                        // }
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
                          "Reserve now",
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
