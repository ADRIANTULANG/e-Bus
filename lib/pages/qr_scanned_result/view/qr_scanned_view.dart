import 'package:ebus/constant/color_class.dart';
import 'package:ebus/constant/peso_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

import '../controller/qr_scanned_controller.dart';

class QrScannedView extends GetView<QrScannedController> {
  const QrScannedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QrScannedController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 8.h, bottom: 5.w),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Obx(
                () => QrImage(
                  padding: EdgeInsets.all(1.w),
                  data: controller.ticketID.value.toString(),
                  version: QrVersions.auto,
                  size: 170.sp,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Obx(
                      () => Text(
                        controller.status.value
                            .toString()
                            .capitalize
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ticket ID: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11.sp,
                            letterSpacing: 1.5),
                      ),
                      Obx(
                        () => Text(
                          controller.ticketID.value,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Passenger Name: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        letterSpacing: 1.5),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 100.w,
                    child: Obx(
                      () => Text(
                        controller.passengerName.value,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  Text(
                    "Origin: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        letterSpacing: 1.5),
                  ),
                  Container(
                    width: 100.w,
                    child: Obx(
                      () => Text(
                        controller.origin.value,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  Text(
                    "Destination: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        letterSpacing: 1.5),
                  ),
                  Container(
                    width: 100.w,
                    child: Obx(
                      () => Text(
                        controller.destination.value,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fare: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11.sp,
                            letterSpacing: 1.5),
                      ),
                      Obx(
                        () => Text(
                          "$pesoSign ${controller.fareAmount.value}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(
                    () => controller.isValid.value == true
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.updateTicket();
                                },
                                child: Container(
                                  height: 8.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.mainColors),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "APPROVED",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 8.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.mainColors),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "REJECT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Expanded(
                            child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Sorry..\nThis ticket has already been used. Thank you!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        letterSpacing: 1.5),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: 8.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColor.mainColors),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "BACK",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                  ),
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
