import 'package:ebus/constant/color_class.dart';
import 'package:ebus/constant/peso_sign.dart';
import 'package:ebus/pages/reserved_ticket_screen/dialog/reserved_ticket_dialog.dart';
import 'package:ebus/pages/reserved_ticket_screen/view/reserved_ticket_payment_options_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../services/location_services.dart';
import '../controller/reserved_ticket_controller.dart';

class ReservedTicketView extends GetView<ReservedTicketController> {
  const ReservedTicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReservedTicketController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Container(
              width: 100.w,
              child: Text(
                "Reserved your\nTicket Now!",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    letterSpacing: 1.5),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 50.h,
              width: 100.w,
              child: Obx(
                () => GoogleMap(
                  // scrollGesturesEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(Get.find<LocationServices>().user_latitude,
                        Get.find<LocationServices>().user_longitude),
                    zoom: 14.4746,
                  ),
                  markers: Set<Marker>.of(controller.markers),
                  onMapCreated:
                      (GoogleMapController googlemapcontroller) async {
                    if (!controller.mapcontroller.isCompleted) {
                      controller.mapcontroller.complete(googlemapcontroller);
                    }
                    controller.googleMapController = await googlemapcontroller;
                    // controller.getCenter(
                    //     currentLatlng: LatLng(
                    //         Get.find<LocationServices>().user_latitude,
                    //         Get.find<LocationServices>().user_longitude),
                    //     clinicLatlng: LatLng(
                    //         double.parse(
                    //             controller.clientHomeModel!.clinicLat),
                    //         double.parse(
                    //             controller.clientHomeModel!.clinicLong)));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Container(
                    height: 6.h,
                    width: 13.w,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "From: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          letterSpacing: 1.5),
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ReservedTicketDialog.showBusPointsOrigin(
                          controller: controller);
                    },
                    child: Container(
                      height: 6.h,
                      padding: EdgeInsets.only(left: 2.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border:
                              Border.all(color: Colors.black, width: 0.2.w)),
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          controller.origin.value,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Container(
                    height: 6.h,
                    width: 13.w,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "To: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          letterSpacing: 1.5),
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ReservedTicketDialog.showBusPointsDestionation(
                          controller: controller);
                    },
                    child: Container(
                      height: 6.h,
                      padding: EdgeInsets.only(left: 2.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border:
                              Border.all(color: Colors.black, width: 0.2.w)),
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          controller.destination.value,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Container(
                    height: 6.h,
                    width: 13.w,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fare: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          letterSpacing: 1.5),
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 2.w),
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black, width: 0.2.w)),
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => Text(
                        "$pesoSign ${controller.fareTotalAmount.value.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                if (controller.destination_lat.value == 0.0 &&
                    controller.destination_long.value == 0.0) {
                  Get.snackbar(
                    "Message",
                    "Please Choose a destination",
                    colorText: Colors.white,
                    backgroundColor: AppColor.mainColors,
                    snackPosition: SnackPosition.TOP,
                  );
                } else if ((controller.origin_long.value == 0.0 &&
                    controller.origin_lat.value == 0.0)) {
                  Get.snackbar(
                    "Message",
                    "Please Choose an Origin",
                    colorText: Colors.white,
                    backgroundColor: AppColor.mainColors,
                    snackPosition: SnackPosition.TOP,
                  );
                } else {
                  Get.to(() => ReservedTicketPaymentOptions());
                }
              },
              child: Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColor.mainColors,
                    border: Border.all(color: Colors.black, width: 0.2.w)),
                alignment: Alignment.center,
                child: Text(
                  "DONE",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
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
