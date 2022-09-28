import 'dart:async';
import 'dart:io';
import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../qr_scanned_result/view/qr_scanned_view.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Timer? debouncer;

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
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return snapshot.data == true
                                    ? Text('Flash: On')
                                    : Text('Flash: Off');
                              },
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('Pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('Start',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 80.w
        : 40.h;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.mainColors,
          borderRadius: 3.w,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      result = scanData;
      print("result: ${result!.code}");
      // controller.pauseCamera();
      if (debouncer?.isActive ?? false) debouncer?.cancel();
      debouncer = Timer(const Duration(seconds: 1), () {
        Get.off(() => QrScannedView(),
            arguments: {"ticketID": result!.code.toString()});
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// class QrCodeView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _QrCodeViewState();
// }

// class _QrCodeViewState extends State<QrCodeView> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   RxBool isAlreadyScanned = false.obs;

//   @override
//   void reassemble() async {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//           Container(height: 100.h, width: 100.w, child: _buildQrView(context)),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     return Obx(
//       () => QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//         overlay: QrScannerOverlayShape(
//             borderColor: isAlreadyScanned.value == false
//                 ? AppColor.mainColors
//                 : Colors.green,
//             borderRadius: 2.w,
//             borderLength: 10.w,
//             borderWidth: 2.w,
//             cutOutSize: 80.w),
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     controller.scannedDataStream.listen((scanData) {
//       result = scanData;
//       print("result: ${result!.code}");
//       controller.pauseCamera();
//       isAlreadyScanned.value = true;
//       Get.off(() => QrScannedView(),
//           arguments: {"ticketID": result!.code.toString()});
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
