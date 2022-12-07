
import 'package:aust_textile_alumni/app/modules/event/views/event_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utill/constant.dart';
import '../controllers/event_controller.dart';

class EventsDetails extends StatefulWidget {

  var index = Get.arguments;


  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {


  EventController controller = Get.put(EventController());


  int currentPosition = 0;


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Color(0xffE5E5E5),
            leading: GestureDetector(
              onTap: (){
                Get.to(
                    ()=> EventView()
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Event Details",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenHeigth * 0.017,
                  color: Color(0xff0FA958),
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xff00602B),
                  height: 1.0,
                ),
              ),
              preferredSize: Size.fromHeight(4.0),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Obx(() => controller.isEventPostLoading.value == true ?        Center(
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
            ):   ListView.separated(
                itemBuilder: ((context, index) {
                  return getDetailsItem(screenHeigth, screenWidth);
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: screenHeigth * 0.015,
                  );
                }),
                itemCount: 1)
            )
          ),
        ),
      ),
    );
  }

  Widget getDetailsItem(double screenHeigth,double screenWidth,){

    var eventImages = <String> [];

    for(int i = 0 ; i< controller.event.value.allEvents![int.parse(widget.index.toString())].image!.length; i++){
      eventImages =  controller.event.value.allEvents![int.parse(widget.index.toString())].image.toString().split(',');
    }

    for(int i = 0 ; i<eventImages.length ; i++){
      eventImages[i] = eventImages[i].trim();
    }


    return Obx(() => Container(
      height: screenHeigth,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          color: Color(0xff56CCF2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_sharp,
                                size: screenWidth * 0.040,
                              ),
                              SizedBox(
                                width: screenWidth * 0.010,
                              ),
                              Text(
                                controller.event.value.allEvents![int.parse(widget.index.toString())].eventTime.toString().substring(16,22) +' | ' +controller.event.value.allEvents![int.parse(widget.index.toString())].eventTime.toString().substring(5,16),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              color: Color(0xff2F80ED),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.event_available_outlined,
                                    color: Colors.white,
                                    size: screenWidth * 0.040,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.010,
                                  ),
                                  Text(
                                    controller.event.value.allEvents![int.parse(widget.index.toString())].eventTypeName.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                         controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType == 0 ? Container(
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
                         ) :   Container(
                           decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.all(Radius.circular(8)),
                             color: Color(0xffF57070),
                           ),
                           child: Padding(
                             padding:  EdgeInsets.all(5.0),
                             child: Row(
                               children: [
                                 Icon(
                                   Icons.check_circle_outline,
                                   color: Colors.white,
                                   size: screenWidth * 0.040,
                                 ),
                                 SizedBox(
                                   width: screenWidth * 0.010,
                                 ),
                                 Text(
                                   "Payment pending",
                                   style: GoogleFonts.poppins(
                                     fontSize: 10,
                                     color: Colors.white,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              content: Container(
                                height: screenHeigth,
                                width: screenWidth,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeigth * 0.050
                                        ),
                                        child: Text(
                                          controller.event.value.allEvents![int.parse(widget.index.toString())].eventTypeName.toString() ,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize:
                                            screenHeigth * 0.025,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeigth * 0.090
                                        ),
                                        child: Text(
                                          'Scan QR Code to get entry',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize:
                                            screenHeigth * 0.015,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenHeigth * 0.010,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                              'assets/images/alert_cancel.png'),
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            color: Colors.transparent,
                                            height: screenHeigth * 0.40,
                                            width:screenHeigth * 0.40,
                                            child: buildQRView()),
                                    )

                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType == 0 ?
                    Icon(
                      Icons.qr_code,
                      size: screenHeigth * 0.060,
                      color: Colors.grey,
                    ) : Visibility(
                        visible: false,
                        child: Container())
                  ),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.010,
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
                        print("possssssssssssssssssssition"+currentPosition.toString());
                      });
                    },
                  )),
              SizedBox(
                height: screenHeigth * 0.015,
              ),
              buildDot(eventImages.length),
              SizedBox(
                height: screenWidth * 0.040,
              ),

              Html(data: controller.event.value.allEvents![int.parse(widget.index.toString())].eventDescription.toString(),
                ),

              controller.event.value.allEvents![int.parse(widget.index.toString())].paymentType.toString() == "1"  ?
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    // await controller.checkPayment();

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

                                SizedBox(height: screenHeigth * 0.015,),
                                GestureDetector(
                                  onTap: () async {
                                    await controller.checkPayment();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/Bkash.png',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/dbb.jpg',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/mastercard.jpg',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeigth * 0.020,),
                                GestureDetector(
                                  onTap: () async {
                                    await controller.checkPayment();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/nogod.jpg',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/upay.jpg',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/images/visa.jpg',
                                        height: screenHeigth * 0.070,
                                        width: screenHeigth * 0.070,
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
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffF57070),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: screenWidth * 0.040,
                          ),
                          SizedBox(
                            width: screenWidth * 0.010,
                          ),
                          Text(
                            "Payment pending",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            "    |    ",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Pay Now",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ) : Visibility(visible: true, child: Container(
              )) ,

              SizedBox(
                height: screenWidth * 0.090,
              ),

              SizedBox(
                height: screenWidth * 0.090,
              ),

              SizedBox(
                height: screenWidth * 0.090,
              ),

              SizedBox(
                height: screenWidth * 0.090,
              ),

            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    controller.controller!.dispose();
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

  Widget buildQRView(){
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 10.0,
        // borderRadius: 10.0,
        borderColor: Colors.red,
      ),
    );
  }
}