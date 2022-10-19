import 'package:ebus/pages/sign_up_screen/api/sign_up_screen_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_class.dart';
import '../dialogs/sign_up_dialog.dart';

class SignUpScreenController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController repeatpassword = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verifIDReceived = "";
  RxBool isCreating = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        // uploadCompanyLogo();
        // controller.addUser(context);
        print("otp success");
        await createAccount();
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  verifiyNumber(
      {required String contact, required SignUpScreenController controller}) {
    isCreating(true);
    auth.verifyPhoneNumber(
        phoneNumber: "+63$contact",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            // print(value.credential);
            // print("smsCode: ${credential.smsCode}");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          // print("EXCEPTION ERROR: ${exception.message}");
        },
        codeSent: (String verificationID, int? resendToken) {
          verifIDReceived = verificationID;
          // print(verificationID);
          // print(resendToken);
          // Get.to(() => ClientRegistrationOtp());
          SignUpDialog.showDialogOtp(controller: controller, contact: contact);
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  createAccount() async {
    bool isSucces = await SignUpScreenApi.createPassenger(
        pas_name: name.text,
        pas_username: username.text,
        pas_email: email.text,
        pas_contact: contactno.text,
        pas_password: password.text);
    if (isSucces == true) {
      Get.back();
      Get.snackbar(
        "Message",
        "Account Successfully Created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
    isCreating(false);
  }
}
