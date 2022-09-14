import 'dart:convert';

List<BusPointsModel> busPointsModelFromJson(String str) =>
    List<BusPointsModel>.from(
        json.decode(str).map((x) => BusPointsModel.fromJson(x)));

String busPointsModelToJson(List<BusPointsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusPointsModel {
  BusPointsModel({
    required this.pId,
    required this.pAddressName,
    required this.pLatitude,
    required this.pLongitude,
  });

  String pId;
  String pAddressName;
  String pLatitude;
  String pLongitude;

  factory BusPointsModel.fromJson(Map<String, dynamic> json) => BusPointsModel(
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
