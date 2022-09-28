import 'package:ebus/constant/color_class.dart';
import 'package:ebus/constant/peso_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../home_screen/controller/home_Screen_controller.dart';
import '../controller/reserved_ticket_controller.dart';

class ReservationTicketResult extends GetView<ReservedTicketController> {
  const ReservationTicketResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.getBack(),
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          padding:
              EdgeInsets.only(left: 5.w, right: 5.w, top: 8.h, bottom: 5.w),
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
                    data: controller.resultticketID.value.toString(),
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
                          controller.resultstatus.value
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
                            controller.resultticketID.value,
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
                          controller.resultpassengerName.value,
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
                          controller.resultoriginName.value,
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
                          controller.resultdestinationName.value,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    Text(
                      "Date: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 9.sp,
                          letterSpacing: 1.5),
                    ),
                    Container(
                      width: 100.w,
                      child: Obx(
                        () => Text(
                          controller.resultdate.value,
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
                            "$pesoSign ${controller.resultfareAmount.value}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          Get.back();
                          Get.back();
                          Get.find<HomeScreenController>()
                              .getPassengersTickets();
                        },
                        child: Container(
                          height: 8.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
