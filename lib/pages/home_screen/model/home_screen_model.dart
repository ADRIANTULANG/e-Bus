import 'dart:convert';

List<PassengerTicketsModel> passengerTicketsModelFromJson(String str) =>
    List<PassengerTicketsModel>.from(
        json.decode(str).map((x) => PassengerTicketsModel.fromJson(x)));

String passengerTicketsModelToJson(List<PassengerTicketsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PassengerTicketsModel {
  PassengerTicketsModel({
    required this.transId,
    required this.origin,
    required this.destination,
    required this.transStatus,
    required this.transFareAmount,
    this.con_name,
    this.bus_plate_number,
    this.driver_name,
  });

  String transId;
  String transStatus;
  String transFareAmount;
  String origin;
  String destination;
  String? con_name;
  String? bus_plate_number;
  String? driver_name;

  factory PassengerTicketsModel.fromJson(Map<String, dynamic> json) =>
      PassengerTicketsModel(
        transId: json["trans_id"],
        transStatus: json["trans_status"],
        transFareAmount: json["trans_fare_amount"],
        origin: json["origin"],
        destination: json["destination"],
        con_name: json["con_name"] ?? "-",
        bus_plate_number: json["bus_plate_number"] ?? "-",
        driver_name: json["driver_name"] ?? "-",
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_status": transStatus,
        "trans_fare_amount": transFareAmount,
        "origin": origin,
        "destination": destination,
        "con_name": con_name,
        "bus_plate_number": bus_plate_number,
        "driver_name": driver_name,
      };
}

List<HomeScreenQrViewerModel> HomeScreenQrViewerModelFromJson(String str) =>
    List<HomeScreenQrViewerModel>.from(
        json.decode(str).map((x) => HomeScreenQrViewerModel.fromJson(x)));

String HomeScreenQrViewerModelToJson(List<HomeScreenQrViewerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeScreenQrViewerModel {
  HomeScreenQrViewerModel({
    required this.transId,
    required this.transFareAmount,
    required this.origin,
    required this.destination,
    required this.pasName,
    required this.transStatus,
  });

  String transId;
  String transFareAmount;
  String origin;
  String destination;
  String pasName;
  String transStatus;

  factory HomeScreenQrViewerModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenQrViewerModel(
        transId: json["trans_id"],
        transFareAmount: json["trans_fare_amount"],
        origin: json["origin"],
        destination: json["destination"],
        pasName: json["pas_name"],
        transStatus: json["trans_status"],
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_fare_amount": transFareAmount,
        "origin": origin,
        "destination": destination,
        "pas_name": pasName,
        "trans_status": transStatus,
      };
}
