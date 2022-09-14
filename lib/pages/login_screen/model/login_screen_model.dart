import 'dart:convert';

List<UserAccountModel> userAccountModelFromJson(String str) =>
    List<UserAccountModel>.from(
        json.decode(str).map((x) => UserAccountModel.fromJson(x)));

String userAccountModelToJson(List<UserAccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAccountModel {
  UserAccountModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.usertype,
    required this.createAt,
    required this.accountId,
  });

  String userId;
  String username;
  String password;
  String usertype;
  DateTime createAt;
  String accountId;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        usertype: json["usertype"],
        createAt: DateTime.parse(json["createAt"]),
        accountId: json["account_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "usertype": usertype,
        "createAt": createAt.toIso8601String(),
        "account_id": accountId,
      };
}

List<PassengerAccountModel> passengerAccountModelFromJson(String str) =>
    List<PassengerAccountModel>.from(
        json.decode(str).map((x) => PassengerAccountModel.fromJson(x)));

String passengerAccountModelToJson(List<PassengerAccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PassengerAccountModel {
  PassengerAccountModel({
    required this.pasId,
    required this.pasName,
    required this.pasUsername,
    required this.pasPassword,
    required this.pasBalance,
  });

  String pasId;
  String pasName;
  String pasUsername;
  String pasPassword;
  String pasBalance;

  factory PassengerAccountModel.fromJson(Map<String, dynamic> json) =>
      PassengerAccountModel(
        pasId: json["pas_id"],
        pasName: json["pas_name"],
        pasUsername: json["pas_username"],
        pasPassword: json["pas_password"],
        pasBalance: json["pas_balance"],
      );

  Map<String, dynamic> toJson() => {
        "pas_id": pasId,
        "pas_name": pasName,
        "pas_username": pasUsername,
        "pas_password": pasPassword,
        "pas_balance": pasBalance,
      };
}

List<AdminAccountModel> adminAccountModelFromJson(String str) =>
    List<AdminAccountModel>.from(
        json.decode(str).map((x) => AdminAccountModel.fromJson(x)));

String adminAccountModelToJson(List<AdminAccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminAccountModel {
  AdminAccountModel({
    required this.adminId,
    required this.adminName,
    required this.adminUsername,
    required this.adminPassword,
  });

  String adminId;
  String adminName;
  String adminUsername;
  String adminPassword;

  factory AdminAccountModel.fromJson(Map<String, dynamic> json) =>
      AdminAccountModel(
        adminId: json["admin_id"],
        adminName: json["admin_name"],
        adminUsername: json["admin_username"],
        adminPassword: json["admin_password"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": adminId,
        "admin_name": adminName,
        "admin_username": adminUsername,
        "admin_password": adminPassword,
      };
}

List<ConductorAccountModel> conductorAccountModelFromJson(String str) =>
    List<ConductorAccountModel>.from(
        json.decode(str).map((x) => ConductorAccountModel.fromJson(x)));

String conductorAccountModelToJson(List<ConductorAccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConductorAccountModel {
  ConductorAccountModel({
    required this.conId,
    required this.conName,
    required this.conUsername,
    required this.conPass,
    required this.conBusId,
  });

  String conId;
  String conName;
  String conUsername;
  String conPass;
  String conBusId;

  factory ConductorAccountModel.fromJson(Map<String, dynamic> json) =>
      ConductorAccountModel(
        conId: json["con_id"],
        conName: json["con_name"],
        conUsername: json["con_username"],
        conPass: json["con_pass"],
        conBusId: json["con_bus_id"],
      );

  Map<String, dynamic> toJson() => {
        "con_id": conId,
        "con_name": conName,
        "con_username": conUsername,
        "con_pass": conPass,
        "con_bus_id": conBusId,
      };
}
