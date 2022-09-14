import 'dart:convert';

List<ConductorsBusDetails> conductorsBusDetailsFromJson(String str) =>
    List<ConductorsBusDetails>.from(
        json.decode(str).map((x) => ConductorsBusDetails.fromJson(x)));

String conductorsBusDetailsToJson(List<ConductorsBusDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConductorsBusDetails {
  ConductorsBusDetails({
    required this.busplatenumber,
    required this.driver,
    required this.conductor,
  });

  String busplatenumber;
  String driver;
  String conductor;

  factory ConductorsBusDetails.fromJson(Map<String, dynamic> json) =>
      ConductorsBusDetails(
        busplatenumber: json["busplatenumber"],
        driver: json["driver"],
        conductor: json["conductor"],
      );

  Map<String, dynamic> toJson() => {
        "busplatenumber": busplatenumber,
        "driver": driver,
        "conductor": conductor,
      };
}
