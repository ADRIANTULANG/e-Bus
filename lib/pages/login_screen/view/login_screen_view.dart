import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
// import '../../admin_home_sreen/view/admin_home_view.dart';
// import '../../home_screen/view/home_screen_view.dart';
import '../../sign_up_screen/view/sign_up_screen_view.dart';
import '../controller/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      // fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/big.gif"))),
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 8.h,
              width: 100.w,
              child: TextField(
                controller: controller.username,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'User name',
                  hintText: 'Enter username',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 8.h,
              width: 100.w,
              child: TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Password',
                  hintText: 'Enter password',
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Obx(
              () => controller.isGettingCredentials.value == false
                  ? Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: InkWell(
                        onTap: () {
                          // Get.to(() => HomeScreenView());
                          // Get.to(() => AdminHomeView());
                          // Get.to(() => ConductorsHomeView());
                          if (controller.username.text.isNotEmpty &&
                              controller.password.text.isNotEmpty) {
                            controller.login();
                          } else {
                            Get.snackbar(
                              "Message",
                              "Oops, Missing Input",
                              colorText: Colors.white,
                              backgroundColor: Colors.lightGreen,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: Container(
                          height: 8.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: AppColor.mainColors,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black54)),
                          alignment: Alignment.center,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              letterSpacing: 4,
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Container(
                        height: 8.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black54)),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignUpScreenView());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
