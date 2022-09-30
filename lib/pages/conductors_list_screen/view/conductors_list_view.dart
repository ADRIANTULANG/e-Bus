import 'package:ebus/pages/conductors_list_screen/controller/conductors_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import 'conductors_list_registration.dart';

class ConductorsListView extends GetView<ConductorsListController> {
  const ConductorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConductorsListController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: (() => controller.onRefresh()),
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
          child: Obx(
            () => controller.isLoading.value == true
                ? Center(
                    child: Container(
                      child: Image.asset("assets/images/mid.gif"),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Conductors",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            letterSpacing: 1.5),
                      ),
                      Expanded(
                          child: Container(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: controller.conductorsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 2.w,
                                      right: 2.w,
                                      top: 1.h,
                                      bottom: 1.h),
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "ID: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller
                                                .conductorsList[index].conId,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Name: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller
                                                .conductorsList[index].conName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Address: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.conductorsList[index]
                                                .con_address,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Contact: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.conductorsList[index]
                                                .con_contact,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Bus: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.conductorsList[index]
                                                .busPlateNumber,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                    ],
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
      ),
      floatingActionButton: Obx(
        () => controller.isLoading.value == true
            ? SizedBox()
            : FloatingActionButton(
                backgroundColor: AppColor.mainColors,
                onPressed: () {
                  controller.busPlateno.value = "Plate no";
                  controller.busId.value = "";
                  controller.conductorname.clear();
                  controller.conductorusername.clear();
                  controller.conductorpassword.clear();
                  Get.to(() => ConductorRegistrationView());
                },
                child: Icon(Icons.add_circle),
              ),
      ),
    );
  }
}
