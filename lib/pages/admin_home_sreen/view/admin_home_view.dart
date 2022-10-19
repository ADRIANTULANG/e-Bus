import 'package:ebus/pages/admin_home_sreen/dialog/admin_home_screen_dialog.dart';
import 'package:ebus/pages/bus_list_screen/view/bus_list_view.dart';
import 'package:ebus/pages/drivers_list_screen/view/drivers_list_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../constant/color_class.dart';
import '../../../constant/peso_sign.dart';
import '../../bus_points_screen/view/bus_points_view.dart';
import '../../conductors_list_screen/view/conductors_list_view.dart';
import '../controller/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeController());
    return WillPopScope(
      onWillPop: (() => AdminHomeScreenDialog.showDialoglogOut()),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Obx(
              () => controller.isLoading.value == true
                  ? Center(
                      child: Container(
                        child: Image.asset("assets/images/mid.gif"),
                      ),
                    )
                  : Column(
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
                                  AdminHomeScreenDialog.showDialoglogOut();
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
                                  Get.to(() => BusListView());
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
                                        FontAwesomeIcons.bus,
                                        size: 11.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Bus",
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
                                  Get.to(() => DriversListView());
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
                                        Icons.airline_seat_recline_normal,
                                        size: 13.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Driver",
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
                                  Get.to(() => ConductorsListView());
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
                                        Icons.person,
                                        size: 13.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Conductors",
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
                            ],
                          ),
                        ),
                        Container(
                          height: 4.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {
                                  Get.to(() => BusPointsView());
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
                                        Icons.location_on,
                                        size: 13.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Points",
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
                                  AdminHomeScreenDialog
                                      .showDialogForMonetization(
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
                                        Icons.monetization_on,
                                        size: 13.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Monetization",
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
                                  AdminHomeScreenDialog
                                      .showDialogAccountSettings(
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
                            ],
                          ),
                        ),
                        Container(
                          height: 4.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {
                                  controller.generateCsvFile();
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
                                        "CSV",
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
                            ],
                          ),
                        ),

                        Container(
                          width: 55.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage("assets/images/big.gif"))),
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Container(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(1.w),
                          // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Fare:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    letterSpacing: 1.5),
                              ),
                              Obx(
                                () => Text(
                                  "$pesoSign ${controller.totalFare.value.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      letterSpacing: 1.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(1.w),
                          // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dev. Earnings:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    letterSpacing: 1.5),
                              ),
                              Obx(
                                () => Text(
                                  "$pesoSign ${controller.developersEarnings.value.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      letterSpacing: 1.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 50.h,
                          child: Obx(
                            () => ListView.builder(
                              padding: EdgeInsets.only(top: 1.h),
                              itemCount: controller.ticketsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: TicketWidget(
                                    width: 100.w,
                                    height: 25.h,
                                    color: AppColor.mainColors,
                                    isCornerRounded: false,
                                    padding: EdgeInsets.only(
                                        left: 2.w, right: 2.w, top: 1.h),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 15.w,
                                                child: QrImage(
                                                  padding: EdgeInsets.all(1.w),
                                                  data: controller
                                                      .ticketsList[0].transId
                                                      .toString(),
                                                  version: QrVersions.auto,
                                                  size: 38.sp,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                // color: Colors.red,
                                                height: 24.h,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Text(
                                                          controller
                                                              .ticketsList[
                                                                  index]
                                                              .transId,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.sp,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 50.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .origin,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 50.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          // color: Colors.red,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .destination,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
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
                                                          "Passenger:",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 40.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          // color: Colors.red,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .pasName,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
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
                                                          "Driver:",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 40.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          // color: Colors.red,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .driver_name!,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
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
                                                          "Con:",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 40.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          // color: Colors.red,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .con_name!,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
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
                                                          "Bus:",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5),
                                                        ),
                                                        Container(
                                                          width: 40.w,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          // color: Colors.red,
                                                          child: Text(
                                                            controller
                                                                .ticketsList[
                                                                    index]
                                                                .bus_plate_number!,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12.sp,
                                                                letterSpacing:
                                                                    1.5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "$pesoSign ${controller.ticketsList[index].transFareAmount}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
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
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
