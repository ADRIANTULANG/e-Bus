import 'dart:convert';

List<ConductorsScannedTicket> conductorsScannedTicketFromJson(String str) =>
    List<ConductorsScannedTicket>.from(
        json.decode(str).map((x) => ConductorsScannedTicket.fromJson(x)));

String conductorsScannedTicketToJson(List<ConductorsScannedTicket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConductorsScannedTicket {
  ConductorsScannedTicket({
    required this.transId,
    required this.transFareAmount,
    required this.origin,
    required this.destination,
    required this.pasName,
    required this.bus_plate_number,
    required this.driver_name,
  });

  String transId;
  String transFareAmount;
  String origin;
  String destination;
  String pasName;
  String bus_plate_number;
  String driver_name;

  factory ConductorsScannedTicket.fromJson(Map<String, dynamic> json) =>
      ConductorsScannedTicket(
        transId: json["trans_id"],
        transFareAmount: json["trans_fare_amount"],
        origin: json["origin"],
        destination: json["destination"],
        bus_plate_number: json["bus_plate_number"],
        driver_name: json["driver_name"] ?? "-",
        pasName: json["pas_name"] ?? "Unkown",
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_fare_amount": transFareAmount,
        "origin": origin,
        "destination": destination,
        "pas_name": pasName,
        "driver_name": driver_name,
        "bus_plate_number": bus_plate_number,
      };
}
