import 'dart:async';

import 'package:ebus/pages/bus_points_screen/api/bus_points_api.dart';
import 'package:ebus/pages/bus_points_screen/controller/bus_points_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import '../../../constant/color_class.dart';

class BusPointsRegistrationController extends GetxController {
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  TextEditingController buspointname = TextEditingController();

  double setLatitude = 0.0;
  double setLongitude = 0.0;

  RxString setName = "".obs;

  RxBool isSearchingPlaces = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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
    setLatitude = lat;
    setLongitude = long;

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0].locality.toString() +
        " " +
        placemarks[0].subAdministrativeArea.toString());
    setName.value = placemarks[0].locality.toString() +
        " " +
        placemarks[0].subAdministrativeArea.toString();
    buspointname.text = setName.value;
  }

  getPlacesLatLng({required String place}) async {
    try {
      List<Location> locations = await locationFromAddress(place);
      setLatitude = await locations[0].latitude;
      setLongitude = await locations[0].longitude;

      print("LATITUDE: ${locations[0].latitude}");
      print("LONGITUDE: ${locations[0].latitude}");
      print(
          "LOCATION: ${locations[0].latitude} ${locations[0].longitude} $place");
      setName.value = place;
      buspointname.text = setName.value;
      navigateToTerminal(
          lat: locations[0].latitude,
          long: locations[0].longitude,
          name: place);
    } on Exception catch (e) {
      print(e);
    }
  }

  createBusPoints() async {
    if (setLatitude == 0.0 || setLongitude == 0.0) {
      Get.snackbar(
        "Message",
        "Please set a location",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      bool isSuccess = await BusPointsApi.createPoints(
          p_address_name: setName.value,
          p_latitude: setLatitude.toString(),
          p_longitude: setLongitude.toString());
      if (isSuccess == true) {
        Get.back();
        Get.find<BusPointsController>().getBusPoints();
        Get.snackbar(
          "Message",
          "Successfully Added",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Message",
          "Sorry.. Please try again later.",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
