import 'package:get/get.dart';

import '../api/conductors_scanned_ticket_api.dart';
import '../model/conductors_scanned_ticket_model.dart';

class ConductorsScannedTicketController extends GetxController {
  RxList<ConductorsScannedTicket> scannedTicketList =
      <ConductorsScannedTicket>[].obs;
  RxString passengerBalance = "".obs;
  @override
  void onInit() async {
    getConductorsScannedTickets();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getConductorsScannedTickets() async {
    var result = await ConductorssCannedTicketApi.getConductorsScannedTickets();
    scannedTicketList.assignAll(result);
  }
}
