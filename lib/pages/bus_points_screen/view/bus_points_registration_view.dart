import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import '../../../services/location_services.dart';
// import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

import '../controller/bus_points_registration_controller.dart';

class BusPointsRegistrationView
    extends GetView<BusPointsRegistrationController> {
  const BusPointsRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BusPointsRegistrationController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Obx(
              () => controller.isSearchingPlaces.value == true
                  ? SizedBox()
                  : Obx(
                      () => GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              Get.find<LocationServices>().user_latitude,
                              Get.find<LocationServices>().user_longitude),
                          zoom: 14.4746,
                        ),
                        onTap: (LatLng value) {
                          controller.ontapMap(
                              lat: value.latitude, long: value.longitude);
                        },
                        markers: Set<Marker>.of(controller.markers),
                        onMapCreated:
                            (GoogleMapController googlemapcontroller) {
                          if (!controller.mapcontroller.isCompleted) {
                            controller.mapcontroller
                                .complete(googlemapcontroller);
                          }
                          controller.googleMapController = googlemapcontroller;
                        },
                      ),
                    ),
            ),
            Positioned(
                top: 6.h,
                child: Container(
                  height: 10.h,
                  width: 100.w,
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8.h,
                        width: 70.w,
                        child: TextField(
                          enabled: false,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5),
                          controller: controller.buspointname,
                          obscureText: false,
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            contentPadding: EdgeInsets.only(left: 2.w),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      InkWell(
                        onTap: () async {
                          controller.isSearchingPlaces.value = true;
                          print(controller.isSearchingPlaces.value);
                          try {
                            Prediction? predictions =
                                await PlacesAutocomplete.show(
                              offset: 0,
                              radius: 100000000000000000,
                              strictbounds: false,
                              region: "ph",
                              // language: "en",
                              context: context,
                              mode: Mode.fullscreen,
                              apiKey: "AIzaSyDv3BDMP_S6x1GWaVSTax3Naf4A301zW6s",
                              components: [
                                new Component(Component.country, "ph")
                              ],
                              onError: (PlacesAutocompleteResponse error) {
                                print("ERROR: $error");
                              },
                              types: [],
                              hint: "Search Bus Terminals or Bus Stops",
                            );
                            FocusScope.of(context).unfocus();
                            controller.isSearchingPlaces.value = await false;

                            if (predictions != null) {
                              print("age dre");
                              print(
                                  "predictions: ${predictions.description.toString()}");
                              controller.getPlacesLatLng(
                                  place: predictions.description.toString());
                            } else {}
                          } on Exception catch (e) {
                            print("exception error: $e");
                          } catch (error) {
                            print("ERROR: ${error}");
                          }
                          controller.isSearchingPlaces.value = false;
                          controller.isSearchingPlaces.value = false;
                          controller.isSearchingPlaces.value = false;
                          controller.isSearchingPlaces.value = false;
                          controller.isSearchingPlaces.value = false;
                          controller.isSearchingPlaces.value = false;
                          Future.delayed(Duration(seconds: 4), () {
                            controller.isSearchingPlaces.value = false;
                          });
                          controller.isSearchingPlaces.value = false;
                          print(controller.isSearchingPlaces.value);
                        },
                        child: Icon(
                          Icons.search_rounded,
                          size: 35.sp,
                          color: AppColor.mainColors,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 4.h,
                child: InkWell(
                  onTap: () {
                    controller.createBusPoints();
                  },
                  child: Container(
                    height: 7.h,
                    width: 100.w,
                    padding: EdgeInsets.only(left: 3.w, right: 3.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "DONE",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 19.sp,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
