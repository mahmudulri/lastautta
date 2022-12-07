import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/forget_pass_controller.dart';
import 'otp_box.dart';

class ForgetpassotpView extends GetView {

  final ForgetPassController controller = Get.put(ForgetPassController());


  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/images/screen.svg",
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.070,),
              Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.070
                ),
                child: Image.asset("assets/images/otp_logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.070
                ),
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: screenHeight * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.010,),
              Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.070
                ),
                child: Text(
                  "check your email to get 5 digits otp",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: screenHeight * 0.015,
                    color:  Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015,),
              Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.070
                ),
                child: Form(
                  // key: controller.otpFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Row(
                      children: [
                        PasswordOtpBox('1'),
                        SizedBox(width: screenHeight * 0.005,),
                        PasswordOtpBox('2'),
                        SizedBox(width: screenHeight * 0.005,),
                        PasswordOtpBox('3'),
                        SizedBox(width: screenHeight * 0.005,),
                        PasswordOtpBox('4'),
                        SizedBox(width: screenHeight * 0.005,),
                        PasswordOtpBox('5'),
                      ],
                    )),
              ),
              SizedBox(height: screenHeight * 0.025,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: screenHeight * 0.070,
                    width: screenWidth * 0.78,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Color(0xff00602B),
                      ),
                      onPressed: () {
                        controller.checkOtpVerification();
                      },
                      child: Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),
              ),

              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/logo.png",)),
              ),
              SizedBox(height: screenHeight * 0.055,),
            ],
          ),
          Obx(() => controller.isProcessing.value == true ?
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              height: screenHeight * 0.25,
              width: screenHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: Lottie.asset("assets/files/loading.json")
                  ),
                  Text("Please wait ....",style: GoogleFonts.poppins(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          ) : Visibility(
              visible: false,
              child: Container()))

        ],
      ),
    );
  }
}
