import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../qr_scanned_result/view/qr_scanned_view.dart';

class QrCodeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  RxBool isAlreadyScanned = false.obs;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(height: 100.h, width: 100.w, child: _buildQrView(context)),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return Obx(
      () => QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: isAlreadyScanned.value == false
                ? AppColor.mainColors
                : Colors.green,
            borderRadius: 2.w,
            borderLength: 10.w,
            borderWidth: 2.w,
            cutOutSize: 80.w),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      print("result: ${result!.code}");
      controller.pauseCamera();
      isAlreadyScanned.value = true;
      Get.off(() => QrScannedView(),
          arguments: {"ticketID": result!.code.toString()});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
