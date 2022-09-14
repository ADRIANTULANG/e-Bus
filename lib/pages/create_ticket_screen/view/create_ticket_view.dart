import 'package:ebus/constant/color_class.dart';
import 'package:ebus/constant/peso_sign.dart';
import 'package:ebus/pages/create_ticket_screen/dialog/create_ticket_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/create_ticket_controller.dart';

class CreateTicketScreenView extends GetView<CreateTicketController> {
  const CreateTicketScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateTicketController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Ticket",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "From:",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: .5.h,
            ),
            InkWell(
              onTap: () {
                CreateTicketDialog.showBusPointsOrigin(controller: controller);
              },
              child: Container(
                height: 6.5.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 2.5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text(
                    controller.origin.value,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "To:",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: .5.h,
            ),
            InkWell(
              onTap: () {
                CreateTicketDialog.showBusPointsDestionation(
                    controller: controller);
              },
              child: Container(
                height: 6.5.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 2.5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text(
                    controller.destination.value,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      letterSpacing: 1.5),
                ),
                Obx(
                  () => Text(
                    "$pesoSign ${controller.fareTotalAmount.value.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            InkWell(
              onTap: () {
                controller.createTicket();
              },
              child: Container(
                height: 6.5.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: AppColor.mainColors,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                alignment: Alignment.center,
                child: Text(
                  "CREATE",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
