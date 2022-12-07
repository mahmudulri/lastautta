
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/details_screen/views/upcoming_details_view.dart';
import '../modules/home/controllers/home_controller.dart';
import '../utill/constant.dart';

class UpcomingHorizontalList extends StatefulWidget {
  late double containerHeight;
  late double containerWidth;
  var viewType;

  UpcomingHorizontalList(double cHeight, double cWidth, view_type) {
    this.containerHeight = cHeight;
    this.containerWidth = cWidth;
    this.viewType = view_type;
  }

  @override
  State<UpcomingHorizontalList> createState() =>
      _CustomHorizontalListState(containerHeight, containerWidth, viewType);
}

class _CustomHorizontalListState extends State<UpcomingHorizontalList> {
  late double containerHeight;
  late double containerWidth;
  var viewType;

  HomeController controller = Get.put(HomeController());

  _CustomHorizontalListState(double cHeight, double cWidth, view_type) {
    this.containerHeight = cHeight;
    this.containerWidth = cWidth;
    this.viewType = view_type;
  }
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      height: containerHeight,
      width: screenWidth,
      child: Obx(() => controller.isEventPostLoading.value == true ?
          // Center(
          //   child: CircularProgressIndicator(),
          // )
      Container(
        color: Colors.white,
        height: screenHeigth * 0.15,
        width: screenHeigth * 0.15,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeigth * 0.15,
                width: screenHeigth * 0.15,
                child: Center(
                    child: Lottie.asset("assets/files/loading.json")
                ),
              ),
              Text("Please wait ....",style: GoogleFonts.poppins(
                  color: Colors.grey
              ),)
            ],
          ),
        ),
      )
         : controller.event.value.allEvents!.length == 0 ? Padding(
           padding:  EdgeInsets.only(
             right: 10.0
           ),
           child: Container(
        height: containerHeight,
        width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffE5E5E5), // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 5  horizontally
                    0.0, // Move to bottom 5 Vertically
                  ),
                ),
              ],
            ),
        child: Center(
            child: Text(
              'No Upcoming event found',
              style: GoogleFonts.poppins(
                color: titleTextColor
              ),
            ),
        ),
      ),
         ) :  ListView.builder(
          itemCount: controller.event.value.allEvents!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var eventImages = <String> [];

            for(int i = 0 ; i< controller.event.value.allEvents![index].image!.length; i++){
              eventImages =  controller.event.value.allEvents![index].image.toString().split(',');
            }

            return GestureDetector(
              onTap: () {
                Get.to(() => UpcomingDetailsView(),
                    arguments: index);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE5E5E5),
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 5  horizontally
                            0.0, // Move to bottom 5 Vertically
                          ),
                        ),
                      ],
                    ),
                    height: containerHeight, width: containerWidth,
                    child: Stack(
                      children: [
                        Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                            IMAGE_HEADER+eventImages![0].toString(),
                          ),
                            fit: BoxFit.cover,),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: screenHeigth * 0.060,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeigth * 0.005,
                                      left: screenHeigth * 0.030
                                  ),
                                  child: Text(controller.event.value.allEvents![index].eventTypeName.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: screenHeigth * 0.015,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeigth * 0.005,
                                      left: screenHeigth * 0.030
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.calendar_today,
                                        color: Colors.white,
                                        size: screenHeigth * 0.015,),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: screenHeigth * 0.010
                                        ),
                                        child: Text(controller.event.value.allEvents![index].eventTime.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: screenHeigth * 0.013,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            );
          })



      ),
    );
  }
}