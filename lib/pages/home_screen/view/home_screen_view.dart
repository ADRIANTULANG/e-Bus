import 'package:ebus/constant/color_class.dart';
import 'package:ebus/constant/peso_sign.dart';
import 'package:ebus/pages/home_screen/dialog/home_screen_dialog.dart';
import 'package:ebus/pages/home_screen/view/home_screen_display_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import '../../qr_code_screen/view/qr_code_view.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../reserved_ticket_screen/view/reserved_ticket_view.dart';
import '../controller/home_Screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return WillPopScope(
      onWillPop: () => HomeScreenDialog.showDialoglogOut(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Obx(
            () => controller.isLoading.value == true
                ? Center(
                    child: Container(
                      child: Image.asset("assets/images/mid.gif"),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: (() => controller.onRefresh()),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Container(
                            height: 6.h,
                            width: 100.w,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    HomeScreenDialog.showDialoglogOut();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.mainColors,
                                        // borderRadius: BorderRadius.circular(3),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              color: Colors.grey),
                                        ]),
                                    child: Icon(
                                      Icons.logout_rounded,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  onTap: () {
                                    HomeScreenDialog.showDialogForAccountUpdate(
                                        controller: controller);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.mainColors,
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              color: Colors.grey),
                                        ]),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.settings,
                                          size: 13.sp,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Settings",
                                          style: TextStyle(
                                            letterSpacing: 1.5,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    HomeScreenDialog.showDialogForBalance(
                                        controller: controller);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.mainColors,
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              color: Colors.grey),
                                        ]),
                                    child: Obx(
                                      () => Text(
                                        "$pesoSign ${controller.passengerBalance.value}",
                                        style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Welcome",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: 15.sp,
                          //                   letterSpacing: 1.5),
                          //             ),
                          //             Text(
                          //               "to E - Bus",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: 15.sp,
                          //                   letterSpacing: 1.5),
                          //             ),
                          //             Text(
                          //               "Fare Collection",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: 15.sp,
                          //                   letterSpacing: 1.5),
                          //             ),
                          //             Text(
                          //               "Payment System",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: 15.sp,
                          //                   letterSpacing: 1.5),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 40.w,
                          //       height: 30.w,
                          //       child: Image.asset("assets/images/big.gif"),
                          //     ),
                          //   ],
                          // ),

                          Container(
                            width: 70.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image:
                                        AssetImage("assets/images/big.gif"))),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            child: Obx(
                              () => controller.passengersTicketList.length == 0
                                  ? Center(
                                      child: Text(
                                        "No Data Available",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            letterSpacing: 1.5),
                                      ),
                                    )
                                  : Container(
                                      height: 70.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(top: 1.h),
                                        itemCount: controller
                                            .passengersTicketList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.h),
                                            child: InkWell(
                                              onTap: () async {
                                                await controller.getTicketData(
                                                    ticketId: controller
                                                        .passengersTicketList[
                                                            index]
                                                        .transId);
                                                Get.to(
                                                    () => HomeScreenQrViewer());
                                              },
                                              child: TicketWidget(
                                                width: 100.w,
                                                height: 25.h,
                                                color: AppColor.mainColors,
                                                shadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 20,
                                                      color: Colors.black),
                                                ],
                                                isCornerRounded: false,
                                                padding: EdgeInsets.only(
                                                    left: 2.w,
                                                    right: 2.w,
                                                    top: 1.h),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 15.w,
                                                            child: QrImage(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.w),
                                                              data: controller
                                                                  .passengersTicketList[
                                                                      index]
                                                                  .transId,
                                                              version:
                                                                  QrVersions
                                                                      .auto,
                                                              size: 38.sp,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            // color: Colors.red,
                                                            height: 22.h,
                                                            width: 65.w,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Ticket ID: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                          .passengersTicketList[
                                                                              index]
                                                                          .transId,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 1.h,
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "From: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          50.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .origin!,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "To: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          50.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .destination!,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Driver: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          40.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .driver_name!,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Conductor: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          40.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .con_name!,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Plate no: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          40.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .bus_plate_number!,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Status: ",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          letterSpacing:
                                                                              1.5),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          40.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .passengersTicketList[index]
                                                                            .transStatus,
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12.sp,
                                                                            letterSpacing: 1.5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    "$pesoSign ${controller.passengersTicketList[index].transFareAmount}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize: 20
                                                                            .sp,
                                                                        letterSpacing:
                                                                            1.5),
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
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        floatingActionButton: Obx(
          () => controller.isLoading.value == true
              ? SizedBox()
              : FloatingActionButton(
                  backgroundColor: AppColor.mainColors,
                  elevation: 10,
                  onPressed: () {
                    Get.to(() => ReservedTicketView());
                  },
                  child: Icon(Icons.qr_code_2),
                ),
        ),
      ),
    );
  }
}
