import 'package:ebus/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/conductors_list_controller.dart';
import '../model/conductors_list_model.dart';

class ConductorRegistrationView extends GetView<ConductorsListController> {
  const ConductorRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conductor Registration",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Name",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.conductorname,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      letterSpacing: 1.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Name',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Contact no",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.contactno,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contactno.text.length == 0) {
                    } else {
                      if (controller.contactno.text[0] != "9" ||
                          controller.contactno.text.length > 10) {
                        controller.contactno.clear();
                      } else {}
                    }
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      letterSpacing: 1.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Contact no',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.address,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      letterSpacing: 1.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Address',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Username",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.conductorusername,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      letterSpacing: 1.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.conductorpassword,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      letterSpacing: 1.5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Bus",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              PopupMenuButton(
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    padding: EdgeInsets.only(left: 2.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => Text(
                        controller.busPlateno.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  itemBuilder: (context) {
                    return controller.busList.map((busModel bus) {
                      return PopupMenuItem(
                        onTap: () {
                          controller.busPlateno.value = bus.busPlateNumber;
                          controller.busId.value = bus.busId;
                        },
                        value: bus,
                        child:
                            Text("${bus.busPlateNumber} - ${bus.driverName}"),
                      );
                    }).toList();
                  }),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  if (controller.conductorname.text.isEmpty ||
                      controller.conductorusername.text.isEmpty ||
                      controller.conductorpassword.text.isEmpty ||
                      controller.contactno.text.isEmpty ||
                      controller.address.text.isEmpty ||
                      controller.busPlateno.value == "Plate no" ||
                      controller.busId.value == "") {
                    Get.snackbar(
                      "Message",
                      "Oopss.. Missing Input.",
                      colorText: Colors.white,
                      backgroundColor: AppColor.mainColors,
                      snackPosition: SnackPosition.TOP,
                    );
                  } else if (controller.contactno.text.length != 10) {
                    Get.snackbar(
                      "Message",
                      "Contact number must start with 9 and should be 10 digit number",
                      colorText: Colors.white,
                      backgroundColor: AppColor.mainColors,
                      snackPosition: SnackPosition.TOP,
                    );
                  } else {
                    controller.createConductorAccount();
                  }
                },
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.mainColors,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "DONE",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
