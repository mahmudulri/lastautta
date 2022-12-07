import 'package:aust_textile_alumni/app/modules/details_screen/views/upcoming_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/home/controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utill/app_colors.dart';
import '../utill/constant.dart';

class VerticalUpcomingList extends StatefulWidget {
  // const VerticalPostList({Key? key}) : super(key: key);

  @override
  State<VerticalUpcomingList> createState() => _VerticalUpcomingListState();
}

class _VerticalUpcomingListState extends State<VerticalUpcomingList> {

  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.BASE);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Upcoming",
          style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: screenHeight * 0.017
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenHeight * 0.022,
              right: screenHeight * 0.022,
            ),
            child: Container(
              height: screenHeight * 0.001,
              color: Colors.green,
              width: screenWidth,
            ),
          ),
          SizedBox(height: screenHeight * 0.025,),

          Obx(() =>
          controller.isEventPostLoading.value == true ? Center(
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
                  Text("Please wait ....", style: GoogleFonts.poppins(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          ) : controller.event.value.allEvents!.length == 0 ? Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'No Upcoming event found',
                    style: GoogleFonts.poppins(
                        color: titleTextColor
                    ),
                  )
                ),
              ),
            ),
          ) :    Expanded(child: ListView.separated(
            itemCount: controller.event.value.allEvents!.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var eventImages = <String>[];

              for (int i = 0; i <
                  controller.event.value.allEvents![index].image!
                      .length; i++) {
                eventImages =
                    controller.event.value.allEvents![index].image.toString()
                        .split(',');
              }

              return GestureDetector(
                onTap: () {
                  Get.to(() => UpcomingDetailsView(),
                      arguments: index);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.019,
                      right: screenHeight * 0.019
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(
                              () => UpcomingDetailsView(),
                          arguments: index
                      );
                    },
                    child: Container(  width: screenHeight * 0.45,
                      height: screenHeight * 0.20,

                      child: Stack(
                        children: [
                          Container(
                            width: screenHeight * 0.45,
                            height: screenHeight * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                            ),
                            child: FadeInImage(
                              placeholder: AssetImage(
                                  'assets/images/notice.jpg'),
                              image: NetworkImage(
                                IMAGE_HEADER +
                                    eventImages![0].toString().toString(),
                              ),
                              fit: BoxFit.cover,),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              height: screenHeight * 0.075,
                              color: Colors.black38,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.010,
                                        left: screenHeight * 0.030
                                    ),
                                    child: Text(
                                      controller.event.value.allEvents![index]
                                          .eventTypeName.toString(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.008,
                                        left: screenHeight * 0.030
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today,
                                          size: screenHeight * 0.015,
                                          color: Colors.white,),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: screenHeight * 0.010
                                          ),
                                          child: Text(
                                            controller.event.value.allEvents![index]
                                                .eventTime.toString()
                                                .substring(0, 21),
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700
                                            ),),
                                        ),
                                      ],
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
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: screenHeight * 0.015,
            );
          },))

          ),
          SizedBox(
            height: screenHeight * 0.010,
          )

        ],
      ),
    );
  }
}