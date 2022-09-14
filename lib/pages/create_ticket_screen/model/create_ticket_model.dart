import 'dart:convert';

List<CreateTicketBusPointsModel> CreateTicketBusPointsModelFromJson(
        String str) =>
    List<CreateTicketBusPointsModel>.from(
        json.decode(str).map((x) => CreateTicketBusPointsModel.fromJson(x)));

String CreateTicketBusPointsModelToJson(
        List<CreateTicketBusPointsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateTicketBusPointsModel {
  CreateTicketBusPointsModel({
    required this.pId,
    required this.pAddressName,
    required this.pLatitude,
    required this.pLongitude,
  });

  String pId;
  String pAddressName;
  String pLatitude;
  String pLongitude;

  factory CreateTicketBusPointsModel.fromJson(Map<String, dynamic> json) =>
      CreateTicketBusPointsModel(
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

List<FareAmountModel> fareAmountModelFromJson(String str) =>
    List<FareAmountModel>.from(
        json.decode(str).map((x) => FareAmountModel.fromJson(x)));

String fareAmountModelToJson(List<FareAmountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FareAmountModel {
  FareAmountModel({
    required this.fareId,
    required this.fareAmount,
  });

  String fareId;
  String fareAmount;

  factory FareAmountModel.fromJson(Map<String, dynamic> json) =>
      FareAmountModel(
        fareId: json["fare_id"],
        fareAmount: json["fare_amount"],
      );

  Map<String, dynamic> toJson() => {
        "fare_id": fareId,
        "fare_amount": fareAmount,
      };
}
