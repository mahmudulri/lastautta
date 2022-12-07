import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/user_post/controllers/mypost_controller.dart';
import '../modules/user_post/views/edit_generalpost_view.dart';
import '../modules/user_post/views/general_post_details.dart';
import '../utill/app_colors.dart';
import '../utill/constant.dart';

class generalpost_list extends StatelessWidget {
  const generalpost_list({
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
    return Obx(() => controller.isGlobalPostLoading.value == true ? Center(
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
    ) : controller.globalPost.value.generalPosts!.length > 0 ? ListView.separated(
        itemCount: controller.globalPost.value.generalPosts!.length,
        shrinkWrap: true,
        itemBuilder: (context , index){
          return  GestureDetector(
            onTap: (){
              Get.to(
                  ()=> GeneralPostDetailsView(),
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
                                Text(controller.globalPost.value.generalPosts![index].createdAt.toString().substring(0,10),
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
                                    child: Text(controller.globalPost.value.generalPosts![index].postType.toString(),
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
                                      child: Text(controller.globalPost.value.generalPosts![index].postTitle.toString(),
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
                                    IMAGE_HEADER+controller.globalPost.value.generalPosts![index].image.toString()
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
                            GestureDetector(
                              onTap: (){
                                // Get.to(
                                //     () => EditGeneralPostView(),
                                //   arguments: index
                                // );
                              },
                              child: Image.asset(
                                "assets/images/edit.png",
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
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
                                child: Html(data: controller.globalPost.value.generalPosts![index].postDescription.toString(),
                                  shrinkWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: screenHeigth * 0.016,
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.grey,
                              //           borderRadius:
                              //           BorderRadius.all(Radius.circular(8))),
                              //       child: Padding(
                              //         padding: EdgeInsets.all(8.0),
                              //         child: Text("#help"),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: screenWidth * 0.020,
                              //     ),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.grey,
                              //           borderRadius:
                              //           BorderRadius.all(Radius.circular(8))),
                              //       child: Padding(
                              //         padding: EdgeInsets.all(8.0),
                              //         child: Text("#help"),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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

    List postTag = <String>[];
    if(controller.globalPost.value.generalPosts![index].tag != null && controller.globalPost.value.generalPosts![index].tag != ""){
      postTag = controller.globalPost.value.generalPosts![index].tag.toString().split(',');
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