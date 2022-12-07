import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/log_in/controllers/log_in_controller.dart';
import '../modules/otp/controllers/otp_controller.dart';
import '../modules/register/controllers/register_controller.dart';

Widget loginButton(double screenHeigth, double screenWidth, String buttonName ,) {
  final LogInController _logController = Get.put(LogInController());
  final OtpController _otpController = Get.put(OtpController());
  final RegisterController _regController = Get.put(RegisterController());

  return SizedBox(
    height: screenHeigth * 0.070,
    width: screenWidth * 0.78,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: Color(0xff00602B),
      ),
      onPressed: buttonName == 'Register' && _regController.buttonEnableNumber.value < 2 ?
          null :
          () {
        if(buttonName == 'Log in') {
          if(_logController.email == "" && _logController.password == ""){
            Get.snackbar(
              "Error",
              "provide all the Log In field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else if(_logController.email == "" || _logController.password == ""){
            Get.snackbar(
              "Error",
              "provide all the LogIn field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }

          else {
            _logController.checkLogin();
          }

        }
        else if(buttonName == 'Register') {


          if(_regController.fullName.value == "" &&
              _regController.batch.value == "" &&
              _regController.mobileNo.value == ""
              && _regController.bloodGroup.value == ""
              &&_regController.email.value == ""
              && _regController.jobSector.value == ""
              && _regController.officeAddress.value == ""
              && _regController.companyName.value == ""
              && _regController.presentAddress.value == ""
              && _regController.permanentAddress.value == ""
              && _regController.password.value == ""
              && _regController.confirmPassword.value == ""
              && _regController.selectedImagePath.value == ""
          ){
            Get.snackbar(
              "Error",
              "provide all the Registration field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else if(_regController.fullName.value == ""
              || _regController.batch.value == ""
              || _regController.mobileNo.value == ""
              || _regController.bloodGroup.value == ""
              ||_regController.email.value == ""
              || _regController.jobSector.value == ""
               || _regController.officialEmail.value == ""
              || _regController.officeAddress.value == ""
              || _regController.companyName.value == ""
              || _regController.presentAddress.value == ""
              || _regController.permanentAddress.value == ""
              || _regController.password.value == ""
              || _regController.confirmPassword.value == ""
              || _regController.selectedImagePath.value == ""){
            Get.snackbar(
              "Error",
              "provide all the Registration field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }

          else if(_regController.password.value.length < 8 && _regController.confirmPassword.value.length < 8){
            Get.snackbar(
              "Error",
              "password must be be al least 8 characters",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else if(_regController.password.value.length < 8 || _regController.confirmPassword.value.length < 8){
            Get.snackbar(
              "Error",
              "password must be be al least 8 characters",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
        }
          else if(_regController.password.value != _regController.confirmPassword.value){
            Get.snackbar(
              "Error",
              "password and confirm must be same",
              colorText: Colors.white,
              backgroundColor:Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }

          else{
            _regController.checkRegistration();
          }

        }
        else{

          if(_otpController.digit1 == "" && _otpController.digit2 == ""
              && _otpController.digit3 == "" && _otpController.digit4 == ""
              && _otpController.digit5 == ""
          ){
            Get.snackbar(
              "Error",
              "provide all the field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else if(_otpController.digit1 == "" || _otpController.digit2 == ""
              && _otpController.digit3 == "" || _otpController.digit4 == ""
              || _otpController.digit5 == ""){
            Get.snackbar(
              "Error",
              "provide all the field",
              colorText: Colors.white,
              backgroundColor: Colors.orangeAccent,
              snackPosition: SnackPosition.BOTTOM,

            );
          }

          else {
            _otpController.checkOtpVerification();
          }
        }
      },
      child: Text(
        buttonName,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
  );
}
