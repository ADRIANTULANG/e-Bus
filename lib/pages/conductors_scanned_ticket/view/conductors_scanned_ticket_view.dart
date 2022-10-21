import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../constant/color_class.dart';
import '../../../constant/peso_sign.dart';
import '../controller/conductors_scanned_ticket_controller.dart';

class ConductorsScannedTicketView
    extends GetView<ConductorsScannedTicketController> {
  const ConductorsScannedTicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConductorsScannedTicketController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: (() => controller.onRefresh()),
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Scanned Tickets",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    letterSpacing: 1.5),
              ),
              Expanded(
                  child: Container(
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: controller.scannedTicketList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: TicketWidget(
                          width: 100.w,
                          height: 25.h,
                          color: AppColor.mainColors,
                          isCornerRounded: false,
                          padding:
                              EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 15.w,
                                      child: QrImage(
                                        padding: EdgeInsets.all(1.w),
                                        data: controller
                                            .scannedTicketList[index].transId,
                                        version: QrVersions.auto,
                                        size: 38.sp,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      // color: Colors.red,
                                      height: 23.h,
                                      width: 65.w,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Ticket ID: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Text(
                                                controller
                                                    .scannedTicketList[index]
                                                    .transId,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "From: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Container(
                                                width: 50.w,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  controller
                                                      .scannedTicketList[index]
                                                      .origin!,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "To: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Container(
                                                width: 50.w,
                                                alignment:
                                                    Alignment.centerRight,
                                                // color: Colors.red,
                                                child: Text(
                                                  controller
                                                      .scannedTicketList[index]
                                                      .destination!,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Passenger:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Container(
                                                width: 40.w,
                                                alignment:
                                                    Alignment.centerRight,
                                                // color: Colors.red,
                                                child: Text(
                                                  controller
                                                      .scannedTicketList[index]
                                                      .pasName!,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Driver:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Container(
                                                width: 40.w,
                                                alignment:
                                                    Alignment.centerRight,
                                                // color: Colors.red,
                                                child: Text(
                                                  controller
                                                      .scannedTicketList[index]
                                                      .driver_name!,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Bus:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              Container(
                                                width: 40.w,
                                                alignment:
                                                    Alignment.centerRight,
                                                // color: Colors.red,
                                                child: Text(
                                                  controller
                                                      .scannedTicketList[index]
                                                      .bus_plate_number!,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                              child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "$pesoSign ${controller.scannedTicketList[index].transFareAmount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20.sp,
                                                  letterSpacing: 1.5),
                                            ),
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
