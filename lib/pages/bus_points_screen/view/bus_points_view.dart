import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../services/location_services.dart';
import '../controller/bus_points_controller.dart';
import 'bus_points_registration_view.dart';

class BusPointsView extends GetView<BusPointsController> {
  const BusPointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BusPointsController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Obx(
              () => GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(Get.find<LocationServices>().user_latitude,
                      Get.find<LocationServices>().user_longitude),
                  zoom: 14.4746,
                ),
                markers: Set<Marker>.of(controller.markers),
                onMapCreated: (GoogleMapController googlemapcontroller) {
                  if (!controller.mapcontroller.isCompleted) {
                    controller.mapcontroller.complete(googlemapcontroller);
                  }
                  controller.googleMapController = googlemapcontroller;
                },
              ),
            ),
            Positioned(
              top: 7.h,
              left: 5.w,
              child: Container(
                width: 100.w,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Bus Stops",
                          style: TextStyle(
                              shadows: [
                                Shadow(blurRadius: 8, color: Colors.white)
                              ],
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainColors,
                              fontSize: 22.sp,
                              letterSpacing: 2),
                        ),
                        Text(
                          "& Terminal",
                          style: TextStyle(
                              shadows: [
                                Shadow(blurRadius: 8, color: Colors.white)
                              ],
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainColors,
                              fontSize: 22.sp,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        controller.markers.clear();
                        Get.to(() => BusPointsRegistrationView());
                      },
                      child: Container(
                        height: 10.h,
                        width: 17.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.white)
                        ], color: AppColor.mainColors, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          size: 25.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 1.h,
                child: Container(
                  height: 9.h,
                  width: 100.w,
                  // color: Colors.red,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.busPointsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 2.w, right: 1.w, top: 1.h, bottom: 1.h),
                          child: InkWell(
                            onTap: () {
                              controller.navigateToTerminal(
                                  lat: double.parse(controller
                                      .busPointsList[index].pLatitude),
                                  long: double.parse(controller
                                      .busPointsList[index].pLongitude),
                                  name: controller
                                      .busPointsList[index].pAddressName);
                            },
                            onLongPress: () {
                              controller.deleteBusPoints(
                                  buspointID:
                                      controller.busPointsList[index].pId);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 2.w, top: 2.h, bottom: 2.h, right: 2.w),
                              decoration: BoxDecoration(
                                  color: AppColor.mainColors,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                    controller
                                        .busPointsList[index].pAddressName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.sp,
                                        letterSpacing: 2),
                                  ),
                                ],
                              ),
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
    );
  }
}
