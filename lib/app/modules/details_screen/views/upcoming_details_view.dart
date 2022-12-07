import 'package:aust_textile_alumni/app/modules/event/controllers/event_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utill/app_colors.dart';
import '../../../utill/constant.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/details_screen_controller.dart';

class UpcomingDetailsView extends StatefulWidget {

  var index = Get.arguments;

  @override
  State<UpcomingDetailsView> createState() => _UpcomingDetailsViewState();
}

class _UpcomingDetailsViewState extends State<UpcomingDetailsView> {


  HomeController controller = Get.put(HomeController());
  EventController eventController= Get.put(EventController());


  int currentPosition = 0;
  

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    var eventImages = <String> [];

    for(int i = 0 ; i< controller.event.value.allEvents![int.parse(widget.index.toString())].image!.length; i++){
      eventImages =  controller.event.value.allEvents![int.parse(widget.index.toString())].image.toString().split(',');
    }

    for(int i = 0 ; i<eventImages.length ; i++){
      eventImages[i] = eventImages[i].trim();
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.back();
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
            'Upcomings',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xff0FA958),
                  fontSize: screenHeight * 0.015
              ),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.only(
            left: screenHeight * 0.020,
            right: screenHeight * 0.020,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:  Obx(() => controller.isEventPostLoading.value == true ? Container(
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
            ) : Column(
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
                          controller.event.value.allEvents![int.parse(widget.index.toString())].eventTypeName.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.017,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                        Text(
                          controller.event.value.allEvents![int.parse(widget.index.toString())].eventTime.toString().substring(0,16),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.016,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType != 0 ?
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/ticket.png",
                              height: screenHeight * 0.025,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.event.value.allEvents![int.parse(widget.index.toString())].eventFee.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "৳",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ],
                        ) : Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            color: Color(0xffF9F9F9),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.grey,
                                  size: screenWidth * 0.040,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.010,
                                ),
                                Text(
                                  "free",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) ,
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.030,
                ),

                CarouselSlider.builder(
                    itemCount: eventImages.length,
                    itemBuilder: (context, index, realIndex) {
                      var imageUrl = eventImages[index];
                      return buildImage(imageUrl, index,screenWidth);
                    },
                    options: CarouselOptions(
                      aspectRatio: 6/3.7,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, realReason) {
                        setState(() {
                          currentPosition = index;
                        });
                      },
                    )),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                buildDot(eventImages.length),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Html(data: controller.event.value.allEvents![int.parse(widget.index.toString())].eventDescription.toString(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.040,
                ),
                controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType != 0 ?
                GestureDetector(
                  onTap: () async {
                    // await eventController.checkPayment();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Pay with',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                    ),
                                  ),),

                                SizedBox(height: screenHeight * 0.015,),
                                GestureDetector(
                                  onTap: () async {
                                    await eventController.checkPayment();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/Bkash.png',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/dbb.jpg',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/mastercard.jpg',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.020,),
                                GestureDetector(
                                  onTap: () async {
                                    await eventController.checkPayment();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/nogod.jpg',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/upay.jpg',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/visa.jpg',
                                        height: screenHeight * 0.070,
                                        width: screenHeight * 0.070,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );

                        });
                  },
                  child: Container(
                    height: screenHeight * 0.060,
                    width: screenWidth - 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ticket.png",
                          height: 30,
                        ),
                        // Text("Buy event ticket"),
                        SizedBox(
                          width: screenWidth * 0.010,
                        ),
                        Text("Buy event ticket",
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.016,
                            )),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 8.0,
                          endIndent: 8.0,
                        ),
                        SizedBox(
                          width: screenWidth * 0.010,
                        ),
                        Text(
                          controller.event.value.allEvents![int.parse(widget.index.toString())].eventFee.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.020,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.020,
                        ),
                        Text(
                          "৳",
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.020,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : Visibility(
                    visible: false,
                    child: Container()),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType != 0 ?  Text(
                  "Your payment secured with SSL payment gateway ",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.015,
                    color: Color(0xff828282),
                  ),
                ) : Visibility(
                    visible: false,
                    child: Container()),
                SizedBox(
                  height: screenHeight * 0.100,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String url, int index,double screenWidth) {
    return Container(
        width: screenWidth,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
        ),
        child: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              IMAGE_HEADER+url.toString()
          ),
          placeholder: AssetImage(
              'assets/images/dubai.png'
          ),
        )
    );
  }


  Widget buildDot(int length ) =>
      Center(
        child: AnimatedSmoothIndicator(
          activeIndex: currentPosition,
          count: length,
          effect: ScrollingDotsEffect(
            dotColor: Colors.black12,
            activeDotColor: Colors.black,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      );
}
