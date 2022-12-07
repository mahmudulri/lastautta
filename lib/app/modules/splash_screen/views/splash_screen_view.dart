import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:outlined_text/models/outlined_text_stroke.dart';
import 'package:outlined_text/outlined_text.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {

  GetStorage _getStorage = GetStorage('app_storage');

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    Timer(Duration(milliseconds: 3000), () {
       checkLoginStatus();

    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0FA958),
        body: Stack(
          children: [
            Center(
              child: Lottie.asset("assets/files/splash.json"),
            ),
            Center(
              child: Image.asset('assets/images/Ausstta_logo.png',
                height: screenHeigth * 0.15,
                width: screenHeigth * 0.15,),
            )
          ],
        ),
      ),
    );
  }

  checkLoginStatus() async {
    var loginToken = await _getStorage.read('token');
    if(loginToken != "" && loginToken!=null){
      print("loof"+loginToken.toString());
      return Get.offNamed(Routes.BASE);
    }
    else{
      return Get.offNamed(Routes.LOG_IN);
    }
  }
}
