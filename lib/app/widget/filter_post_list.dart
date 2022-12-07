import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/user_post/controllers/mypost_controller.dart';
import '../modules/user_post/views/filter_post_details.dart';
import '../utill/app_colors.dart';
import '../utill/constant.dart';

class filterpost_list extends StatelessWidget {
  const filterpost_list({
    Key? key,
    required this.screenWidth,
    required this.screenHeigth,
    required this.controller
  }) : super(key: key);

  final double screenWidth;
  final double screenHeigth;
  final MypostController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isAllFilterPostLoading.value == true ? Center(
      child:Container(
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
    ) : controller.allFilterPost.value.filterDatePosts!.length> 0 ? ListView.separated(
      itemCount: controller.allFilterPost.value.filterDatePosts!.length,
      shrinkWrap: true,
      itemBuilder: (context , index){
        return  GestureDetector(
          onTap: (){
            controller.fetchUserAllFilterPost();
            Get.to(
                    () => FilterPostDetailsView(),
              arguments: index
            );
          },
          child: Container(
            // height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding:  EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: screenWidth * 0.020,
                              ),
                              Text(controller.allFilterPost.value.filterDatePosts![index].createdAt.toString().substring(0,10),
                                style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.025
                                ),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Color(0xffF2C94C)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(controller.allFilterPost.value.filterDatePosts![index].postType.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.025
                                    ),),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.020,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(controller.allFilterPost.value.filterDatePosts![index].postTitle.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.025
                                      ),),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * 0.010,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: FadeInImage(
                                image: NetworkImage(
                                    IMAGE_HEADER+controller.allFilterPost.value.filterDatePosts![index].image.toString()
                                ),
                                placeholder: AssetImage(
                                    'assets/images/dubai.png'
                                ),
                                height: screenHeigth * 0.10,
                                width: screenWidth * 0.30,
                                fit: BoxFit.fill,
                              )
                          ),
                          SizedBox(
                            height: screenHeigth * 0.015,
                          ),
                          Image.asset(
                            "assets/images/edit.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.030,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenHeigth * 0.10,
                              width: screenWidth * 0.80,
                              child: Html(data: controller.allFilterPost.value.filterDatePosts![index].postDescription.toString(),
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: screenHeigth * 0.016,
                            ),
                             getTagRow(index)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: screenHeigth * 0.008,
      );
    },) : Center(
      child: Text('No Post Found',
          style: GoogleFonts.poppins(
              fontSize: screenHeigth * 0.020,
              color: titleTextColor
          )),
    )
    );
  }


  Widget getTagRow(int index){

    controller.fetchUserAllFilterPost();

    List postTag = <String>[];
    if(controller.allFilterPost.value.filterDatePosts![index].tag != null && controller.allFilterPost.value.filterDatePosts![index].tag != ""){
      postTag = controller.allFilterPost.value.filterDatePosts![index].tag.toString().split(',');
    }
    print("alll taaaaaaaaaag .......... "+postTag.toString());
    return postTag.length >2 ? Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
              BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(postTag[0].toString(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.025
              ),),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.020,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
              BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(postTag[1].toString(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.025
              ),),
          ),
        ),
      ],
    )

        : postTag.length >1 ? Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
              BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(postTag[0].toString(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.025
              ),),
          ),
        ),
      ],
    ) : Visibility(
        visible: false,
        child: Container());
  }
}