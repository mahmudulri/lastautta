import 'package:aust_textile_alumni/app/modules/log_in/views/log_in_view.dart';
import 'package:aust_textile_alumni/app/modules/otp/providers/otp_provider.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  var digit1 = ''.obs;
  var digit2 = ''.obs;
  var digit3 = ''.obs;
  var digit4 = ''.obs;
  var digit5 = ''.obs;

  var isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  Future<void> checkOtpVerification() async {


    isLoading.value = true;

    var otpVerificationStatus =
    await OtpProvider().verifyOtp(digit1.value, digit2.value, digit3.value, digit4.value, digit5.value);
    print("login status ......." + otpVerificationStatus.toString());

    if (otpVerificationStatus == true) {
      isLoading.value = false;
      // Get.offAndToNamed(Routes.HOME);
      Get.toNamed(Routes.LOG_IN);
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Error !!! Provide correct otp ...",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }
}
