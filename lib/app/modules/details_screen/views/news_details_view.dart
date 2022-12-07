import 'package:aust_textile_alumni/app/modules/base/views/base_view.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/constant.dart';
import '../../home/controllers/home_controller.dart';

class NewsDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    HomeController controller  = Get.put(HomeController());

    var index = Get.arguments;

    print("index _ notice "+index.toString());

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.to(
                  ()=>BaseView()
              );
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
            'News and Notice',
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
            child: Obx(() => controller.isNewsLoading.value == true ? Container(
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
                          controller.allNews.value.noticeNews![int.parse(index.toString())].fullName.toString().toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.017,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                        Text(
                          controller.allNews.value.noticeNews![int.parse(index.toString())].createdAt.toString(),
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
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.050,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEFEFEF),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            controller.allNews.value.noticeNews![int.parse(index.toString())].categoryName.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenHeight * 0.018,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.020,
                    ),
                    Container(
                      height: screenHeight * 0.050,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEFEFEF),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            controller.allNews.value.noticeNews![int.parse(index.toString())].subcategoryName.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenHeight * 0.018,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Container(
                  height: screenHeight * 0.250,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  FadeInImage(
                    placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                    IMAGE_HEADER+ controller.allNews.value.noticeNews![int.parse(index.toString())].noticeNewsImage.toString(),
                  ),
                    fit: BoxFit.cover,),
                ),

                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Html(data: controller.allNews.value.noticeNews![int.parse(index.toString())].noticeNewsDescription.toString(),
                  ),
                ),
                // venue & Note section.........................
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                // Divider(
                //   thickness: 2,
                //   color: Color(0xffBDBDBD),
                // ),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                // Row(
                //   children: [
                //     Text(
                //       "Relevant",
                //       style: GoogleFonts.poppins(
                //         fontSize: screenHeight * 0.020,
                //         color: Color(0xff4F4F4F),
                //       ),
                //     ),
                //   ],
                // ),
                // Container(
                //   height: screenHeight * 0.250,
                //   width: screenWidth - 10,
                //   decoration: BoxDecoration(
                //
                //     // color: Colors.grey.shade100,
                //   ),
                //   child: ListView.separated(
                //       physics: BouncingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (_, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(0.0),
                //           child: Card(
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.shade100,
                //                     blurRadius: 4.0,
                //                     spreadRadius: 4.0,
                //                     offset: Offset(
                //                       0.0,
                //                       10.0,
                //                     ), // shadow direction: bottom right
                //                   ),
                //                   // BoxShadow(
                //                   //   color: Colors.grey.shade100,
                //                   //   blurRadius: 2.0,
                //                   //   spreadRadius: 2.0,
                //                   //   offset: Offset(
                //                   //     10.0,
                //                   //     0.0,
                //                   //   ), // shadow direction: bottom right
                //                   // ),
                //                 ],
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: Colors.white,
                //               ),
                //               // height: screenHeigth * 0.200,
                //               width: screenWidth * 0.380,
                //               // color: Colors.white,
                //             ),
                //           ),
                //         );
                //       },
                //       separatorBuilder: (_, index) {
                //         return SizedBox(
                //           width: 5,
                //         );
                //       },
                //       itemCount: 10),
                // ),
                SizedBox(
                  height: screenHeight * 0.080,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
