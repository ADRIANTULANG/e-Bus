import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';

class QrCodePassengerScanApi {
  static var client = http.Client();
//<List<busModel>>

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

  static Future addAndUpdateBalance(
      {required String newBalance, required String passengerID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-passenger-balance.php'),
        body: {
          "newBalance": newBalance.toString(),
          "passengerID": passengerID.toString()
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
}
