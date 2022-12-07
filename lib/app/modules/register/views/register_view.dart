import 'package:aust_textile_alumni/app/modules/register/views/register_page/page_one.dart';
import 'package:aust_textile_alumni/app/modules/register/views/register_page/page_three.dart';
import 'package:aust_textile_alumni/app/modules/register/views/register_page/page_two.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/login_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final RegisterController regController = Get.put(RegisterController());

  PageController controller = PageController();

  int number = 0;
  int pageNumber = 1;

  List pagelist = [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
           return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              height: screenHeigth,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    "assets/images/screen.svg",
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeigth * 0.070,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.770,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenHeigth * 0.020
                                  ),
                                  child: Text(
                                    "Welcome",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: screenHeigth * 0.020,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenHeigth * 0.020,
                                top: screenHeigth * 0.012
                            ),
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                           left: screenHeigth * 0.008,
                           right: screenHeigth * 0.008,
                          top: screenHeigth * 0.015,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Color(0xff3FBA79))),
                          height: screenHeigth * 0.630,
                          width: screenWidth - 20,
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeigth * 0.010,
                              ),
                              SizedBox(
                                width: screenWidth * 0.770,
                                child: Row(
                                  children: [
                                    Text(
                                      "Register as a new Alumni",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenHeigth * 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeigth * 0.010,
                              ),
                              SizedBox(
                                width: screenWidth * 0.770,
                                child: Row(
                                  children: [
                                    Text(
                                      "The",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenHeigth * 0.015,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.010,
                                    ),
                                    Text(
                                      "RED",
                                      style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontSize: screenHeigth * 0.015,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.010,
                                    ),
                                    Text(
                                      "fields must be filled out ",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenHeigth * 0.015,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Container(
                                  child: pagelist[number],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 35),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: screenHeigth * 0.015
                                        ),
                                        child: Text(
                                          '$pageNumber out of 3',
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14.0
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (number == 0) {
                                              print("end");
                                            } else {
                                              number--;
                                              pageNumber--;
                                              regController.buttonEnableNumber.value--;
                                              print("end"+ regController.buttonEnableNumber.value.toString());
                                            }
                                          });
                                        },
                                        child: Visibility(
                                          visible: number == 0 ? false : true ,
                                          child: Icon(

                                            Icons.arrow_back_ios,
                                            size: screenHeigth * 0.025,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (number == 2) {
                                              print("end");
                                            } else {
                                              number++;
                                              pageNumber++;
                                              regController.buttonEnableNumber.value++;
                                              print("end"+ regController.buttonEnableNumber.value.toString());
                                            }
                                          });
                                        },
                                        child: Visibility(
                                          visible: number == 2 ? false : true,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: screenHeigth * 0.025,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeigth * 0.015,
                      ),
                      loginButton(screenHeigth, screenWidth, "Register"),
                      SizedBox(
                        height: screenHeigth * 0.010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                // Get.toNamed(Routes.LOG_IN);
                                Get.toNamed(Routes.LOG_IN);
                              },
                              child: Text(
                                " LOGIN",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                  Obx(() => regController.isLoading.value == true ?
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.white,
                      height: screenHeigth * 0.25,
                        width: screenHeigth * 0.25,
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
                  ) : Container())

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

