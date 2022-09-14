import 'package:ebus/pages/create_ticket_screen/controller/create_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CreateTicketDialog {
  static showBusPointsOrigin({required CreateTicketController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 45.h,
        width: 90.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Select Origin",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.buspointsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      child: InkWell(
                        onTap: () {
                          controller.origin.value =
                              controller.buspointsList[index].pAddressName;
                          controller.originID.value =
                              controller.buspointsList[index].pId;
                          controller.origin_lat.value = double.parse(
                              controller.buspointsList[index].pLatitude);
                          controller.origin_long.value = double.parse(
                              controller.buspointsList[index].pLongitude);
                          Get.back();
                          if (controller.destination_lat.value != 0.0 &&
                              controller.destination_long.value != 0.0 &&
                              controller.origin_lat.value != 0.0 &&
                              controller.origin_long != 0.0) {
                            controller.calculateDistance(
                                controller.origin_lat.value,
                                controller.origin_long.value,
                                controller.destination_lat.value,
                                controller.destination_long.value);
                          }
                        },
                        child: Container(
                          width: 90.w,
                          padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            top: BorderSide(color: Colors.grey),
                          )),
                          child: Text(
                            controller.buspointsList[index].pAddressName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ]),
      ),
    ));
  }

  static showBusPointsDestionation(
      {required CreateTicketController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 45.h,
        width: 90.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Select Desstination",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.buspointsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      child: InkWell(
                        onTap: () {
                          controller.destination.value =
                              controller.buspointsList[index].pAddressName;
                          controller.destinationID.value =
                              controller.buspointsList[index].pId;
                          controller.destination_lat.value = double.parse(
                              controller.buspointsList[index].pLatitude);
                          controller.destination_long.value = double.parse(
                              controller.buspointsList[index].pLongitude);
                          Get.back();
                          if (controller.destination_lat.value != 0.0 &&
                              controller.destination_long.value != 0.0 &&
                              controller.origin_lat.value != 0.0 &&
                              controller.origin_long != 0.0) {
                            controller.calculateDistance(
                                controller.origin_lat.value,
                                controller.origin_long.value,
                                controller.destination_lat.value,
                                controller.destination_long.value);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
                          alignment: Alignment.centerLeft,
                          width: 90.w,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            top: BorderSide(color: Colors.grey),
                          )),
                          child: Text(
                            controller.buspointsList[index].pAddressName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ]),
      ),
    ));
  }
}
