import 'package:aust_textile_alumni/app/widget/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/otp_input.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {

  final OtpController controller = Get.put(OtpController());
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
                        OtpBox('1'),
                        SizedBox(width: screenHeight * 0.005,),
                        OtpBox('2'),
                        SizedBox(width: screenHeight * 0.005,),
                        OtpBox('3'),
                        SizedBox(width: screenHeight * 0.005,),
                        OtpBox('4'),
                        SizedBox(width: screenHeight * 0.005,),
                        OtpBox('5'),
                      ],
                    )),
              ),
              SizedBox(height: screenHeight * 0.025,),
              Align(
                  alignment: Alignment.center,
                  child: loginButton(screenHeight, screenWidth, 'Continue')),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/logo.png",)),
              ),
              SizedBox(height: screenHeight * 0.055,),
            ],
          ),
          Obx(() => controller.isLoading.value == true ?
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
