import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../../../services/storage_services.dart';
import '../model/conductors_scanned_ticket_model.dart';

class ConductorssCannedTicketApi {
  static var client = http.Client();
//<List<busModel>>
  // <List<ConductorsBusDetails>>
  static Future<List<ConductorsScannedTicket>>
      getConductorsScannedTickets() async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-conductors-ticket-scanned.php'),
        body: {
          "conductorID":
              Get.find<StorageServices>().storage.read('conId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return conductorsScannedTicketFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Tickets Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Tickets Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Tickets Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
