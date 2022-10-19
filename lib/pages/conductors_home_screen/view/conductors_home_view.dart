import 'package:ebus/constant/color_class.dart';
import 'package:ebus/pages/conductors_home_screen/dialog/conductors_home_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../conductors_scanned_ticket/view/conductors_scanned_ticket_view.dart';
import '../../create_ticket_screen/view/create_ticket_view.dart';
import '../../qr_code_screen/view/qr_code_view.dart';
import '../controller/conductors_home_controller.dart';

class ConductorsHomeView extends GetView<ConductorsHomeController> {
  const ConductorsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConductorsHomeController());
    return WillPopScope(
      onWillPop: (() => ConductorsHomeDialog.showDialoglogOut()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          width: 100.w,
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
                                ConductorsHomeDialog.showDialoglogOut();
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
                                ConductorsHomeDialog.showConductorUpdateAccount(
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
                      SizedBox(
                        height: 2.h,
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
                      Container(
                        width: 65.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage("assets/images/big.gif"))),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => CreateTicketScreenView());
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20.h,
                                width: 43.w,
                                decoration: BoxDecoration(
                                    color: AppColor.mainColors,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          color: Colors.grey)
                                    ]),
                                child: Icon(
                                  FontAwesomeIcons.ticket,
                                  size: 45.sp,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => QrCodeView());
                                },
                                child: Container(
                                  height: 20.h,
                                  width: 43.w,
                                  decoration: BoxDecoration(
                                      color: AppColor.mainColors,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            color: Colors.grey)
                                      ]),
                                  child: Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: 45.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                ConductorsHomeDialog.showConductorsBusDetails(
                                    controller: controller);
                              },
                              child: Container(
                                height: 20.h,
                                width: 43.w,
                                decoration: BoxDecoration(
                                    color: AppColor.mainColors,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          color: Colors.grey)
                                    ]),
                                child: Icon(
                                  FontAwesomeIcons.bus,
                                  size: 45.sp,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ConductorsScannedTicketView());
                              },
                              child: Container(
                                height: 20.h,
                                width: 43.w,
                                decoration: BoxDecoration(
                                    color: AppColor.mainColors,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          color: Colors.grey)
                                    ]),
                                child: Icon(
                                  Icons.list,
                                  size: 45.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
