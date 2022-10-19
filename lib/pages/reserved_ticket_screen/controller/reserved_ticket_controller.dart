import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../../home_screen/controller/home_Screen_controller.dart';
import '../api/reserved_ticket_api.dart';
import '../model/reserved_tickets_model.dart';
import '../view/reservation_ticket_qr_view.dart';

class ReservedTicketController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<ReservedTicketsBusPointsModel> busPointsList =
      <ReservedTicketsBusPointsModel>[].obs;
  Rx<LatLng> centerOfTwoLocation = LatLng(0.0, 0.0).obs;

  RxBool isCheckGcash = false.obs;
  RxBool isPaymaya = false.obs;
  RxBool isEwallet = false.obs;
  RxBool isSubscribing = false.obs;

  RxString isSelectedPaymentGateway = "".obs;

  RxString origin = "".obs;
  RxString destination = "".obs;
  RxString originID = "".obs;
  RxString destinationID = "".obs;

  RxDouble farePerkilo = 0.0.obs;

  RxDouble fareTotalAmount = 0.0.obs;

  RxDouble origin_lat = 0.0.obs;
  RxDouble origin_long = 0.0.obs;
  RxDouble destination_lat = 0.0.obs;
  RxDouble destination_long = 0.0.obs;

  RxString resultticketID = "".obs;
  RxString resultpassengerName = "".obs;
  RxString resultoriginName = "".obs;
  RxString resultdestinationName = "".obs;
  RxString resultfareAmount = "".obs;
  RxString resultstatus = "".obs;
  RxString resultdate = "".obs;

  @override
  void onInit() async {
    await getFareAmountValue();
    await getBusPoints();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getFareAmountValue() async {
    var result = await ReservedTicketApi.getFareAmountValue();
    if (result.length != 0) {
      farePerkilo.value = double.parse(result[0].fareAmount);
    }
  }

  getCenter({
    required LatLng originLatlng,
    required LatLng destinationLatlng,
    required String origin,
    required String destination,
  }) {
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId(origin),
        position: originLatlng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: origin)));
    markers.add(Marker(
        markerId: MarkerId(destination),
        position: destinationLatlng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: destination)));
    LatLngBounds bounds =
        LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    if (destinationLatlng.latitude > originLatlng.latitude &&
        destinationLatlng.longitude > originLatlng.longitude) {
      bounds =
          LatLngBounds(southwest: originLatlng, northeast: destinationLatlng);
    } else if (destinationLatlng.longitude > originLatlng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destinationLatlng.latitude, originLatlng.longitude),
          northeast:
              LatLng(originLatlng.latitude, destinationLatlng.longitude));
    } else if (destinationLatlng.latitude > originLatlng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(originLatlng.latitude, destinationLatlng.longitude),
          northeast:
              LatLng(destinationLatlng.latitude, originLatlng.longitude));
    } else {
      bounds =
          LatLngBounds(southwest: destinationLatlng, northeast: originLatlng);
    }

    double center_lat =
        (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    double center_long =
        (bounds.southwest.longitude + bounds.northeast.longitude) / 2;
    centerOfTwoLocation.value = LatLng(center_lat, center_long);

    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 20.w));
    print("age dre");
  }

  getBusPoints() async {
    var result = await ReservedTicketApi.getBusPoints();
    busPointsList.assignAll(result);
  }

  calculateDistance(lat1, lon1, lat2, lon2, origin, destination) async {
    var distanceInMeters =
        await (Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000);
    print(distanceInMeters.toString() + "Kilometers");
    fareTotalAmount.value = distanceInMeters * farePerkilo.value;
    getCenter(
        originLatlng: LatLng(lat1, lon1),
        destinationLatlng: LatLng(lat2, lon2),
        origin: origin,
        destination: destination);
  }

  createTicket() async {
    isSubscribing(true);
    DateTime d = DateTime.now();
    String year = d.year.toString();
    String month = d.month.toString();
    String date = d.day.toString();
    if (month.length == 1) {
      month = "0" + month;
    }
    if (date.length == 1) {
      date = "0" + date;
    }
    String finalDateFormat = year + "-" + month + "-" + date;
    var result = await ReservedTicketApi.reservedTicket(
        trans_origin_id: originID.value.toString(),
        trans_destination_id: destinationID.value.toString(),
        trans_fare_amount: fareTotalAmount.value.toStringAsFixed(2),
        trans_date_created: finalDateFormat);
    print("ticketID" + result.toString());
    if (result == false) {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      getTicketData(ticketID: result);
    }
  }

  getTicketData({required String ticketID}) async {
    var result =
        await ReservedTicketApi.getTicketDataResult(ticketID: ticketID);
    if (result.isNotEmpty) {
      resultticketID.value = result[0].transId;
      resultpassengerName.value = result[0].pasName;
      resultoriginName.value = result[0].origin;
      resultdestinationName.value = result[0].destination;
      resultfareAmount.value = result[0].transFareAmount;
      resultstatus.value = result[0].transStatus;
      resultdate.value = DateFormat.yMMMEd()
          .format(DateTime.parse(result[0].trans_date_created));
      Get.to(() => ReservationTicketResult());
      Get.snackbar(
        "Message",
        "Successfully Reserved",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
    isSubscribing(false);
  }

  updateBalance({required String newbalance}) async {
    await ReservedTicketApi.updateBalance(newbalance: newbalance);
  }

  getBack() {
    Get.back();
    Get.back();
    Get.back();
    Get.find<HomeScreenController>().getPassengersTickets();
  }
}
