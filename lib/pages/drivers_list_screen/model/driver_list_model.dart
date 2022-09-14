import 'dart:convert';

List<DriverModel> driverModelFromJson(String str) => List<DriverModel>.from(
    json.decode(str).map((x) => DriverModel.fromJson(x)));

String driverModelToJson(List<DriverModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverModel {
  DriverModel({
    required this.driverId,
    required this.driverName,
    required this.isDriving,
  });

  String driverId;
  String driverName;
  String isDriving;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        driverId: json["driver_id"],
        driverName: json["driver_name"],
        isDriving: json["isDriving"],
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "driver_name": driverName,
        "isDriving": isDriving,
      };
}
