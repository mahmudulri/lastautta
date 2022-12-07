import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text_feild.dart';
import '../../../widget/login_button.dart';
import '../../forget_pass/views/forget_pass_view.dart';
import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {

  final LogInController controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
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
                        "Login to Continue",
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
                  custom_textfield(
                      screenHeight,
                      screenWidth,
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      "User email",controller),
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  custom_textfield(
                      screenHeight,
                      screenWidth,
                      Icon(
                        Icons.password,
                        color: Colors.white,
                        size: 30,
                      ),
                      "Password",controller),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot your id or password ?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(
                                () => ForgetPassView()
                            );
                          },
                          child: Text(
                            "RESET NOW",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  loginButton(screenHeight, screenWidth, "Log in",),
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont' have account?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.REGISTER
                            );
                          },
                          child: Text(
                            " REGISTER",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),

                    ],
                  ),

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
      ),
    );
  }
}

