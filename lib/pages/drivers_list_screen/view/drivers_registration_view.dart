import 'package:ebus/pages/drivers_list_screen/controller/driver_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';

class DriversRegistrationView extends GetView<DriversListController> {
  const DriversRegistrationView({Key? key}) : super(key: key);

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
              "Driver Registration",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Driver name",
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
                controller: controller.drivername,
                obscureText: false,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    letterSpacing: 1.5),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (controller.drivername.text.isEmpty) {
                  Get.snackbar(
                    "Message",
                    "Oopss.. Missing Input.",
                    colorText: Colors.white,
                    backgroundColor: AppColor.mainColors,
                    snackPosition: SnackPosition.TOP,
                  );
                } else {
                  controller.createDriver();
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
