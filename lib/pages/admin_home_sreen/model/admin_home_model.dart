import 'dart:convert';

List<MonetazationPercentageModel> monetazationPercentageModelFromJson(
        String str) =>
    List<MonetazationPercentageModel>.from(
        json.decode(str).map((x) => MonetazationPercentageModel.fromJson(x)));

String monetazationPercentageModelToJson(
        List<MonetazationPercentageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonetazationPercentageModel {
  MonetazationPercentageModel({
    required this.precentageId,
    required this.percentageValue,
  });

  String precentageId;
  String percentageValue;

  factory MonetazationPercentageModel.fromJson(Map<String, dynamic> json) =>
      MonetazationPercentageModel(
        precentageId: json["precentage_id"],
        percentageValue: json["percentage_value"],
      );

  Map<String, dynamic> toJson() => {
        "precentage_id": precentageId,
        "percentage_value": percentageValue,
      };
}

List<TicketsModel> ticketsModelFromJson(String str) => List<TicketsModel>.from(
    json.decode(str).map((x) => TicketsModel.fromJson(x)));

String ticketsModelToJson(List<TicketsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketsModel {
  TicketsModel({
    required this.transId,
    required this.transFareAmount,
    required this.transStatus,
    required this.pasName,
    required this.destination,
    required this.origin,
    this.con_name,
    this.bus_plate_number,
    this.driver_name,
  });

  String transId;
  String transFareAmount;
  String transStatus;
  String pasName;
  String origin;
  String destination;
  String? con_name;
  String? bus_plate_number;
  String? driver_name;

  factory TicketsModel.fromJson(Map<String, dynamic> json) => TicketsModel(
        transId: json["trans_id"],
        transFareAmount: json["trans_fare_amount"],
        transStatus: json["trans_status"],
        pasName: json["pas_name"] ?? "Unknown",
        origin: json["origin"],
        destination: json["destination"],
        con_name: json["con_name"] ?? "-",
        bus_plate_number: json["bus_plate_number"] ?? "-",
        driver_name: json["driver_name"] ?? "-",
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_fare_amount": transFareAmount,
        "trans_status": transStatus,
        "pas_name": pasName,
        "origin": origin,
        "destination": destination,
        "con_name": con_name,
        "bus_plate_number": bus_plate_number,
        "driver_name": driver_name,
      };
}

List<FareAmountValueModel> fareAmountValueModelFromJson(String str) =>
    List<FareAmountValueModel>.from(
        json.decode(str).map((x) => FareAmountValueModel.fromJson(x)));

String fareAmountValueModelToJson(List<FareAmountValueModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FareAmountValueModel {
  FareAmountValueModel({
    required this.fareId,
    required this.fareAmount,
  });

  String fareId;
  String fareAmount;

  factory FareAmountValueModel.fromJson(Map<String, dynamic> json) =>
      FareAmountValueModel(
        fareId: json["fare_id"],
        fareAmount: json["fare_amount"],
      );

  Map<String, dynamic> toJson() => {
        "fare_id": fareId,
        "fare_amount": fareAmount,
      };
}
