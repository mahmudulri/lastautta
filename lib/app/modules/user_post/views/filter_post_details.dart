import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/app_colors.dart';
import '../../../utill/constant.dart';
import '../controllers/mypost_controller.dart';

class FilterPostDetailsView extends GetView {

  var index = Get.arguments;

  MypostController controller = Get.put(MypostController());


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Filter post',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Color(0xff0FA958),
                fontSize: screenHeight * 0.015
            ),
          ),
        ),
      ),
      body: Obx(() => controller.isAllFilterPostLoading.value == true ?Container(
        height: screenHeight,
        width: screenWidth,
        child: Center(
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
        ),
      ) :
      Padding(
        padding: EdgeInsets.only(
          left: screenHeight * 0.020,
          right: screenHeight * 0.020,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Divider(
                color: titleTextColor,
                thickness: 1.0,
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.allFilterPost.value.filterDatePosts![int.parse(index.toString())].postTitle.toString().toUpperCase(),
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4F4F4F),
                        ),
                      ),
                      Text(
                        controller.allFilterPost.value.filterDatePosts![int.parse(index.toString())].createdAt.toString().substring(0,10),
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.016,
                          color: Color(0xff4F4F4F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),

              SizedBox(
                height: screenHeight * 0.020,
              ),

              FadeInImage(
                image: NetworkImage(
                    IMAGE_HEADER+controller.allFilterPost.value.filterDatePosts![int.parse(index.toString())].image.toString()
                ),
                placeholder: AssetImage(
                    'assets/images/dubai.png'
                ),
                height:  screenHeight * 0.350,
                width:screenWidth,
                fit: BoxFit.fill,
              ),

              SizedBox(
                height: screenHeight * 0.030,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(data:controller.allFilterPost.value.filterDatePosts![int.parse(index.toString())].postDescription.toString()),
              ),
              // venue & Note section.........................
              SizedBox(
                height: screenHeight * 0.030,
              ),
            ],
          ),
        ),
      )),
    );
  }
}