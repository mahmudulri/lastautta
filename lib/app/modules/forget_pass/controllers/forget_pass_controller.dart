import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../log_in/views/log_in_view.dart';
import '../providers/forgetpass_provider.dart';
import '../views/forgetpassotp_view.dart';
import '../views/setforgetpass_view.dart';

class ForgetPassController extends GetxController {
  //TODO: Implement ForgetPassController

  final count = 0.obs;

  var isLoading = false.obs;
  var email = ''.obs;

  var digit1 = ''.obs;
  var digit2 = ''.obs;
  var digit3 = ''.obs;
  var digit4 = ''.obs;
  var digit5 = ''.obs;

  var isProcessing = false.obs;

  var setPassProcessing = false.obs;

  var password = ''.obs;
  var confirmPass = ''.obs;

  var isVisible = false.obs;

  var isVisible2 = false.obs;


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

  Future<void> requestForgetPassword() async {

    isLoading.value = true;

    var logInStatus = await ForgetpassProvider().doForgetPassRequest(email.value);
    print("login status ......." + logInStatus.toString());

    if (logInStatus == true) {
      isLoading.value = false;
      Get.to(
          () => ForgetpassotpView()
      );
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not Send Otp",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  Future<void> checkOtpVerification() async {


    isLoading.value = true;

    var otpVerificationStatus =
    await ForgetpassProvider().verifyOtp(digit1.value, digit2.value, digit3.value, digit4.value, digit5.value);
    print("login status ......." + otpVerificationStatus.toString());

    if (otpVerificationStatus == true) {
      isProcessing.value = false;
      Get.to(
              () => SetforgetpassView()
      );

    } else {
      isProcessing.value = false;
      Get.snackbar(
        "Status",
        "Error !!! Provide correct otp ...",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  Future<void> setNewPassword() async {


    setPassProcessing.value = true;

    var otpVerificationStatus =
    await ForgetpassProvider().setNewPassword(password.value, confirmPass.value);
    print("login status ......." + otpVerificationStatus.toString());

    if (otpVerificationStatus == true) {
      setPassProcessing.value = false;
      Get.to(
              () => LogInView()
      );
      Get.snackbar(
        "Status",
        "Your password has been changed...",
        colorText: Colors.white,
        backgroundColor: Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );

    } else {
      setPassProcessing.value = false;
      Get.snackbar(
        "Status",
        "Error !!! Password not changed...",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }
}
