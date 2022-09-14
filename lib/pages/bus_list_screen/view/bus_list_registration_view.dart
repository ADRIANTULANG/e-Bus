import 'package:ebus/constant/color_class.dart';
import 'package:ebus/pages/bus_list_screen/controller/bus_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../model/bus_list_model.dart';

class BusListRegistrationView extends GetView<BusListController> {
  const BusListRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bus Registration",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Plate no",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              height: 6.h,
              width: 100.w,
              child: TextField(
                controller: controller.plateno,
                obscureText: false,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    letterSpacing: 1.5),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  labelText: 'Plate no',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Driver",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            PopupMenuButton(
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  padding: EdgeInsets.only(left: 2.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Text(
                      controller.driverName.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
                itemBuilder: (context) {
                  return controller.driversList.map((DriverModel driver) {
                    return PopupMenuItem(
                      onTap: () {
                        controller.driverName.value = driver.driverName;
                        controller.driverID.value = driver.driverId;
                      },
                      value: driver,
                      child: Text("${driver.driverName}"),
                    );
                  }).toList();
                }),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (controller.plateno.text.isEmpty ||
                    controller.driverName.value == "" ||
                    controller.driverName.value == "Driver") {
                  Get.snackbar(
                    "Message",
                    "Oopss.. Missing Input.",
                    colorText: Colors.white,
                    backgroundColor: AppColor.mainColors,
                    snackPosition: SnackPosition.TOP,
                  );
                } else {
                  controller.createBus();
                }
              },
              child: Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.mainColors,
                ),
                alignment: Alignment.center,
                child: Text(
                  "DONE",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }
}
