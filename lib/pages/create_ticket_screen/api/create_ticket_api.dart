import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../model/create_ticket_model.dart';

class CreateTicketApi {
  static var client = http.Client();
//<List<busModel>>
  static Future createTicket({
    required String trans_origin_id,
    required String trans_destination_id,
    required String trans_fare_amount,
    required String trans_date_created,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-ticket.php'),
        body: {
          "trans_origin_id": trans_origin_id,
          "trans_destination_id": trans_destination_id,
          "trans_fare_amount": trans_fare_amount,
          "trans_date_created": trans_date_created,
          "trans_scannedBy_con_id":
              Get.find<StorageServices>().storage.read('conId').toString(),
          "trans_pass_id": "-",
          "trans_status": "Invalid"
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Ticket Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Ticket Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Create Ticket Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future<List<FareAmountModel>> getFareAmountValue() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-fare-amount.php'),
        body: {},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return fareAmountModelFromJson(
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

  static Future<List<CreateTicketBusPointsModel>> getPoints() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-bus-points.php'),
        body: {},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return CreateTicketBusPointsModelFromJson(
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
}
