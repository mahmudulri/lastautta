import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/forget_pass_controller.dart';

class SetforgetpassView extends GetView {

  final ForgetPassController controller = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Obx(() => SafeArea(
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
                      "Set New Password",
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
                        Icons.password,
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
                            obscureText: controller.isVisible.value == true ? false : true ,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                suffixIcon: IconButton(onPressed: () {
                                  controller.isVisible.value == true ?
                                  controller.isVisible.value = false : controller.isVisible.value = true;

                                },
                                  icon: controller.isVisible == true ? Icon(Icons.visibility, color: Colors.black,) :
                                  Icon(Icons.visibility_off, color: Colors.grey,),

                                )
                            ),
                            onChanged : (value) {
                              controller.password.value = value.toString();
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
                        Icons.password,
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
                            obscureText: controller.isVisible2.value == true ? false : true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                                suffixIcon: IconButton(onPressed: () {
                                  controller.isVisible2.value == true ?
                                  controller.isVisible2.value = false : controller.isVisible2.value = true;

                                },
                                  icon: controller.isVisible2 == true ? Icon(Icons.visibility, color: Colors.black,) :
                                  Icon(Icons.visibility_off, color: Colors.grey,),

                                )
                            ),
                            onChanged : (value) {
                              controller.confirmPass.value = value.toString();
                            },

                          ),
                        ),
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
                        if(controller.password.value != controller.confirmPass.value){
                          Get.snackbar(
                            "Error",
                            "password and confirm must be same",
                            colorText: Colors.white,
                            backgroundColor:Colors.orangeAccent,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else {
                          controller.setNewPassword();
                        }
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

                Visibility(
                    visible: false,
                    child: Text(controller.isVisible.value.toString()))


              ],
            ),
            Obx(() => controller.setPassProcessing.value == true ?
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
    ));
  }
}
