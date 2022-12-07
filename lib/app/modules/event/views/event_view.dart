import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../utill/constant.dart';
import '../../base/views/base_view.dart';
import '../controllers/event_controller.dart';
import 'event_details.dart';


class EventView extends StatefulWidget {
  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {

  EventController controller = Get.put(EventController());
  // const MyEvents({super.key});
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
                    ()=> BaseView()
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "My Events",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenHeigth * 0.015,
                  color: Color(0xff0FA958),
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xff00602B),
                  height: 2.0,
                ),
              ),
              preferredSize: Size.fromHeight(4.0),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.only(
              top: 20,
            ),
            child: Obx(() => controller.isEventPostLoading.value == true ?
            Center(
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
            ) :  ListView.separated(
                itemBuilder: ((context, index) {
                  return getListItem(screenHeigth, screenWidth,index);
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: screenHeigth * 0.008,
                  );
                }),
                itemCount: controller.event.value.allEvents!.length)),
          ),
        ),
      ),
    );
  }

  Widget getListItem(double screenHeigth,double screenWidth,int index){

    var eventImages = <String> [].obs;
    
    for(int i = 0 ; i< controller.event.value.allEvents![index].image!.length; i++){
      eventImages.value =  controller.event.value.allEvents![index].image.toString().split(',');
    }
    return Obx(() => GestureDetector(
      onTap: (){
        Get.to(
                () => EventsDetails(),
          arguments: index

        );
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                     eventImages.length == 0 ?  Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15)
                       ),
                       child: Image.asset(
                         "assets/images/dubai.png",
                         height: screenHeigth * 0.08,
                         width: screenWidth * 0.25,
                         fit: BoxFit.fill,
                       ),
                     ) : Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                             Radius.circular(15)
                           )
                       ),
                       child: FadeInImage(
                         image: NetworkImage(
                             IMAGE_HEADER+eventImages![0].toString()
                         ),
                         placeholder: AssetImage(
                             'assets/images/dubai.png'
                         ),
                         height: screenHeigth * 0.08,
                         width: screenWidth * 0.25,
                         fit: BoxFit.fill,
                       ),
                     )
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 0.025,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenHeigth * 0.010
                          ),
                          child: Text(
                            controller.event.value.allEvents![index].eventTitle.toString().toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                        ),
                        Container(
                            height: screenHeigth * 0.065,
                            width: double.infinity,
                            child: Html(data: controller.event.value.allEvents![index].eventDescription.toString(),
                              shrinkWrap: true,))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            controller.event.value.allEvents![index].eventTime.toString().substring(16,22) +' | ' +controller.event.value.allEvents![index].eventTime.toString().substring(5,16),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 2nd container........................................2nd container..................//

                  // SizedBox(
                  //   width: screenWidth * 0.010,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
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
                             controller.event.value.allEvents![index].eventTypeName.toString().length > 12 ?
                            controller.event.value.allEvents![index].eventTypeName.toString().substring(0,8)+".." : controller.event.value.allEvents![index].eventTypeName.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 3rd container........................................3rd container..................//
                  controller.event.value.allEvents![index].paymentType != 0 ?
                      controller.isPaymentComplete.value != true ?
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          color: Color(0xffF57070),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await controller.checkPayment();
                          },
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
                      ) :
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(5.0),
                          child:  Icon(Icons.qr_code)
                        ),
                      ) :
                      Container(
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
                          SizedBox(
                            width: screenWidth * 0.045,
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
                                                    controller.event.value.allEvents![index].eventTypeName.toString() ,
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
                              child: Icon(Icons.qr_code)),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
  //
  // @override
  // void dispose() {
  //   controller.controller!.dispose();
  //   super.dispose();
  // }

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

