import 'dart:convert';

List<ReservedTicketsBusPointsModel> ReservedTicketsBusPointsModelFromJson(
        String str) =>
    List<ReservedTicketsBusPointsModel>.from(
        json.decode(str).map((x) => ReservedTicketsBusPointsModel.fromJson(x)));

String ReservedTicketsBusPointsModelToJson(
        List<ReservedTicketsBusPointsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservedTicketsBusPointsModel {
  ReservedTicketsBusPointsModel({
    required this.pId,
    required this.pAddressName,
    required this.pLatitude,
    required this.pLongitude,
  });

  String pId;
  String pAddressName;
  String pLatitude;
  String pLongitude;

  factory ReservedTicketsBusPointsModel.fromJson(Map<String, dynamic> json) =>
      ReservedTicketsBusPointsModel(
        pId: json["p_id"],
        pAddressName: json["p_address_name"],
        pLatitude: json["p_latitude"],
        pLongitude: json["p_longitude"],
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "p_address_name": pAddressName,
        "p_latitude": pLatitude,
        "p_longitude": pLongitude,
      };
}

List<ReservationFareAmountModel> ReservationFareAmountModelFromJson(
        String str) =>
    List<ReservationFareAmountModel>.from(
        json.decode(str).map((x) => ReservationFareAmountModel.fromJson(x)));

String ReservationFareAmountModelToJson(
        List<ReservationFareAmountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservationFareAmountModel {
  ReservationFareAmountModel({
    required this.fareId,
    required this.fareAmount,
  });

  String fareId;
  String fareAmount;

  factory ReservationFareAmountModel.fromJson(Map<String, dynamic> json) =>
      ReservationFareAmountModel(
        fareId: json["fare_id"],
        fareAmount: json["fare_amount"],
      );

  Map<String, dynamic> toJson() => {
        "fare_id": fareId,
        "fare_amount": fareAmount,
      };
}

List<QrResultModel> QrResultModelFromJson(String str) =>
    List<QrResultModel>.from(
        json.decode(str).map((x) => QrResultModel.fromJson(x)));

String QrResultModelToJson(List<QrResultModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QrResultModel {
  QrResultModel({
    required this.transId,
    required this.transFareAmount,
    required this.origin,
    required this.destination,
    required this.pasName,
    required this.transStatus,
    required this.trans_date_created,
  });

  String transId;
  String transFareAmount;
  String origin;
  String destination;
  String pasName;
  String transStatus;
  String trans_date_created;

  factory QrResultModel.fromJson(Map<String, dynamic> json) => QrResultModel(
        transId: json["trans_id"],
        transFareAmount: json["trans_fare_amount"],
        origin: json["origin"],
        destination: json["destination"],
        pasName: json["pas_name"],
        transStatus: json["trans_status"],
        trans_date_created: json["trans_date_created"],
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_fare_amount": transFareAmount,
        "origin": origin,
        "destination": destination,
        "pas_name": pasName,
        "trans_status": transStatus,
        "trans_date_created": trans_date_created,
      };
}
