import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:ebus/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../model/home_screen_model.dart';

class HomeScreenApi {
  static var client = http.Client();
//
  static Future<List<PassengerTicketsModel>> getPassengersTickets() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-passengers-tickets.php'),
        body: {
          "passengerID": Get.find<StorageServices>().storage.read("pasId")
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return passengerTicketsModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Passengers Tickets Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Passengers Tickets Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Passengers Tickets Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future<List<HomeScreenQrViewerModel>> getTicketDataResult(
      {required String ticketID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-ticket-data.php'),
        body: {"ticketID": ticketID.toString()},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return HomeScreenQrViewerModelFromJson(
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

  static Future addAndUpdateBalance({required String newBalance}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-passenger-balance.php'),
        body: {
          "newBalance": newBalance.toString(),
          "passengerID":
              Get.find<StorageServices>().storage.read('pasId').toString()
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Balance Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Balance Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Update Balance Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future updatePassengerAccount({
    required String pas_name,
    required String pas_username,
    required String pas_password,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-passenger-account.php'),
        body: {
          "pas_name": pas_name.toString(),
          "pas_username": pas_username.toString(),
          "pas_password": pas_password.toString(),
          "pas_id": Get.find<StorageServices>().storage.read('pasId').toString()
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Passenger Account Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Passenger Account Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Update Passenger Account Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future getPassengerDetails({required String passengerID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-passenger-details.php'),
        body: {
          "accountID": passengerID,
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return (jsonDecode(response.body)['data']);
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Passenger Details Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Passenger Details Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Passenger Details Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
