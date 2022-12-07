import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text_feild.dart';
import '../controllers/forget_pass_controller.dart';

class ForgetPassView extends GetView<ForgetPassController> {

  final ForgetPassController controller = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              "assets/images/screen.svg",
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Image.asset("assets/images/logo.png",),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter mail to continue",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeight * .022,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.070,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff00602B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      height: screenHeight * 0.070,
                      width: 70,
                      child: Icon(
                        Icons.mail_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Color(0xff00602B),
                        ),
                      ),
                      height: screenHeight * 0.070,
                      width: screenWidth * 0.60,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(
                            left: 20,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'User Mail',
                            ),
                            onChanged : (value) {
                                 controller.email.value = value.toString();
                            },

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your email to get 5 digit otp ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: screenHeight * 0.055,
                ),

                SizedBox(
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
                          controller.requestForgetPassword();
                      },
                      child: Text(
                        'Send Otp',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                )


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
      ),
    );
  }
}
