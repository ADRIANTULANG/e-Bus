import 'dart:convert';

List<ScanResultModel> scanResultModelFromJson(String str) =>
    List<ScanResultModel>.from(
        json.decode(str).map((x) => ScanResultModel.fromJson(x)));

String scanResultModelToJson(List<ScanResultModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScanResultModel {
  ScanResultModel({
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

  factory ScanResultModel.fromJson(Map<String, dynamic> json) =>
      ScanResultModel(
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
