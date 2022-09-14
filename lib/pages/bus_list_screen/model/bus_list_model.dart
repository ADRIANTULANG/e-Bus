import 'dart:convert';

List<busModel> busModelFromJson(String str) =>
    List<busModel>.from(json.decode(str).map((x) => busModel.fromJson(x)));

String busModelToJson(List<busModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class busModel {
  busModel({
    required this.busId,
    required this.busPlateNumber,
    required this.busDriverId,
    required this.driverName,
  });

  String busId;
  String busPlateNumber;
  String busDriverId;
  String driverName;

  factory busModel.fromJson(Map<String, dynamic> json) => busModel(
        busId: json["bus_id"],
        busPlateNumber: json["bus_plate_number"],
        busDriverId: json["bus_driver_id"],
        driverName:
            json["driver_name"] == null ? "No Driver" : json["driver_name"],
      );

  Map<String, dynamic> toJson() => {
        "bus_id": busId,
        "bus_plate_number": busPlateNumber,
        "bus_driver_id": busDriverId,
        "driver_name": driverName,
      };
}

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
