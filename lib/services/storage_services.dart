import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  saveCredentials({
    required String userID,
    required String username,
    required String password,
    required String usertype,
    required String createAt,
    required String accountId,
  }) {
    storage.write("userID", userID);
    storage.write("username", username);
    storage.write("password", password);
    storage.write("usertype", usertype);
    storage.write("createAt", createAt);
    storage.write("accountId", accountId);
  }

  savePassengerCredentials({
    required String pasId,
    required String pasName,
    required String pasUsername,
    required String pasPassword,
    required String pasBalance,
  }) {
    storage.write("pasId", pasId);
    storage.write("pasName", pasName);
    storage.write("pasUsername", pasUsername);
    storage.write("pasPassword", pasPassword);
    storage.write("pasBalance", pasBalance);
  }

  saveAdminCredentials({
    required String adminId,
    required String adminName,
    required String adminUsername,
    required String adminPassword,
  }) {
    storage.write("adminId", adminId);
    storage.write("adminName", adminName);
    storage.write("adminUsername", adminUsername);
    storage.write("adminPassword", adminPassword);
  }

  saveConductorsCredentials({
    required String conId,
    required String conName,
    required String conUsername,
    required String conPass,
  }) {
    storage.write("conId", conId);
    storage.write("conName", conName);
    storage.write("conUsername", conUsername);
    storage.write("conPass", conPass);
  }

  removeStorageCredentials() {
    storage.remove("conId");
    storage.remove("conName");
    storage.remove("conUsername");
    storage.remove("conPass");

    storage.remove("adminId");
    storage.remove("adminName");
    storage.remove("adminUsername");
    storage.remove("adminPassword");

    storage.remove("pasId");
    storage.remove("pasName");
    storage.remove("pasUsername");
    storage.remove("pasPassword");
    storage.remove("pasBalance");

    storage.remove("userID");
    storage.remove("username");
    storage.remove("password");
    storage.remove("usertype");
    storage.remove("createAt");
    storage.remove("accountId");
  }
}
