import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/splashscreen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Image.asset("assets/images/splashscreen.gif"),
        ),
      ),
    );
  }
}
