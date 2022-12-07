import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/event_controller.dart';

class QRScanedView extends StatefulWidget {
  const QRScanedView({Key? key}) : super(key: key);

  @override
  State<QRScanedView> createState() => _QRScanedViewState();
}

class _QRScanedViewState extends State<QRScanedView> {


  EventController controller = Get.put(EventController());


  @override
  Widget build(BuildContext context) {



    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    controller.controller!.stopCamera();
    controller.controller!.resumeCamera();


    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeigth,
            width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Successful",
              style: GoogleFonts.poppins(
              ),),
              SizedBox(height: screenHeigth * 0.025,),
              Text(controller.result!.code.toString(),
                style: GoogleFonts.poppins(
                ),),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.result = null;
  }
}
