import 'dart:convert';

List<ConductorsModel> conductorsModelFromJson(String str) =>
    List<ConductorsModel>.from(
        json.decode(str).map((x) => ConductorsModel.fromJson(x)));

String conductorsModelToJson(List<ConductorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConductorsModel {
  ConductorsModel({
    required this.conId,
    required this.conName,
    required this.conUsername,
    required this.conPass,
    required this.conBusId,
    required this.busPlateNumber,
    required this.con_contact,
    required this.con_address,
  });

  String conId;
  String conName;
  String conUsername;
  String conPass;
  String conBusId;
  String busPlateNumber;
  String con_contact;
  String con_address;

  factory ConductorsModel.fromJson(Map<String, dynamic> json) =>
      ConductorsModel(
        conId: json["con_id"],
        conName: json["con_name"],
        conUsername: json["con_username"],
        conPass: json["con_pass"],
        conBusId: json["con_bus_id"],
        con_contact: json["con_contact"],
        con_address: json["con_address"],
        busPlateNumber: json["bus_plate_number"] ?? "-",
      );

  Map<String, dynamic> toJson() => {
        "con_id": conId,
        "con_name": conName,
        "con_username": conUsername,
        "con_pass": conPass,
        "con_bus_id": conBusId,
        "bus_plate_number": busPlateNumber,
        "con_contact": con_contact,
        "con_address": con_address,
      };
}

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
