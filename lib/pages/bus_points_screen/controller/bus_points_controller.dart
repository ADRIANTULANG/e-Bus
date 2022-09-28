import 'dart:async';

import 'package:ebus/pages/bus_points_screen/api/bus_points_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import '../../../constant/color_class.dart';
import '../model/bus_points_model.dart';

class BusPointsController extends GetxController {
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  RxList<BusPointsModel> busPointsList = <BusPointsModel>[].obs;

  @override
  void onInit() {
    getBusPoints();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBusPoints() async {
    var result = await BusPointsApi.getPoints();
    busPointsList.assignAll(result);
  }

  navigateToTerminal(
      {required double lat, required double long, required String name}) async {
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId("new"),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        infoWindow: InfoWindow(
          title: name,
        )));

    await googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(lat, long),
            tilt: 20.440717697143555,
            zoom: 17.151926040649414)));
  }

  ontapMap({required double lat, required double long}) async {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId("new"),
      position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ));

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0].locality.toString() +
        " " +
        placemarks[0].subAdministrativeArea.toString());
  }

  deleteBusPoints({required String buspointID}) async {
    bool isSuccess = await BusPointsApi.deleteBuspoints(buspointID: buspointID);
    if (isSuccess == true) {
      getBusPoints();
      Get.snackbar(
        "Message",
        "Successfully Deleted",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
