import 'package:ebus/pages/bus_list_screen/view/bus_list_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/bus_list_controller.dart';

class BusListView extends GetView<BusListController> {
  const BusListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BusListController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Bus",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                  letterSpacing: 1.5),
            ),
            Expanded(
                child: Container(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.busList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Bus ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 1.5),
                                ),
                                Text(
                                  controller.busList[index].busId,
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
                                  "Plate No: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 1.5),
                                ),
                                Text(
                                  controller.busList[index].busPlateNumber,
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
                                  "Driver: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 1.5),
                                ),
                                Text(
                                  controller.busList[index].driverName,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.mainColors,
        onPressed: () {
          controller.driverName.value = "Driver";
          controller.driverID.value = "";
          controller.plateno.clear();
          Get.to(() => BusListRegistrationView());
        },
        child: Icon(Icons.add_circle),
      ),
    );
  }
}
