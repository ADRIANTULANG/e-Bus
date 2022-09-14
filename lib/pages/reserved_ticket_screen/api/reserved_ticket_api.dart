import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../model/reserved_tickets_model.dart';

class ReservedTicketApi {
  static var client = http.Client();
//<List<busModel>>
  static Future<List<ReservedTicketsBusPointsModel>> getBusPoints() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-bus-points.php'),
        body: {},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return ReservedTicketsBusPointsModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Points Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Points Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Points Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future<List<ReservationFareAmountModel>> getFareAmountValue() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-fare-amount.php'),
        body: {},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return ReservationFareAmountModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Fare Amount Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Fare Amount Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Fare Amount Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future reservedTicket({
    required String trans_origin_id,
    required String trans_destination_id,
    required String trans_fare_amount,
    required String trans_date_created,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-ticket-reservation.php'),
        body: {
          "trans_scannedBy_con_id": "-",
          "trans_origin_id": trans_origin_id,
          "trans_destination_id": trans_destination_id,
          "trans_fare_amount": trans_fare_amount,
          "trans_date_created": trans_date_created,
          "trans_pass_id": Get.find<StorageServices>().storage.read('pasId'),
          "trans_status": "Valid",
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return (jsonDecode(response.body)['ticketID']).toString();
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Reserved Ticket Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Reserved Ticket Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Reserved Ticket Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future<List<QrResultModel>> getTicketDataResult(
      {required String ticketID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-ticket-data.php'),
        body: {"ticketID": ticketID.toString()},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return QrResultModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Ticket Data Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Ticket Data Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Ticket Data Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
