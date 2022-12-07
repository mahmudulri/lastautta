import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_html/flutter_html.dart';


import '../modules/user_post/controllers/mypost_controller.dart';
import '../modules/user_post/views/edit_jopost_view.dart';
import '../modules/user_post/views/job_post_details.dart';

class jobpost_list extends StatelessWidget {
  const jobpost_list({
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
    return Obx(() => controller.isJobPostLoading.value == true ?
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
    ) : controller.jobPost.value.jobPosts!.length > 0 ? ListView.separated(
        itemCount: controller.jobPost.value.jobPosts!.length,
        shrinkWrap: true,
        itemBuilder: (context , index){
          return  GestureDetector(
            onTap: (){
              Get.to(
                  () => JobPostDetailsView(),
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
                                Text(controller.jobPost.value.jobPosts![index].createdAt.toString().substring(0,10),
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.028
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
                                    child: Text(controller.jobPost.value.jobPosts![index].jobType.toString(),
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
                                      child: Text(controller.jobPost.value.jobPosts![index].jobTitle.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.025
                                          )),
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
                                  IMAGE_HEADER+controller.jobPost.value.jobPosts![index].image.toString()
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
                                Get.to(
                                    () => EditJobPostView(),
                                  arguments: index
                                );
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
                                child: Html(data: controller.jobPost.value.jobPosts![index].jobDescription.toString(),
                                shrinkWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: screenHeigth * 0.016,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(controller.jobPost.value.jobPosts![index].jobLocation.toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.025
                                        ),),
                                    ),
                                  ),
                                ],
                              ),
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
      child: Text('No Job Post Found',
          style: GoogleFonts.poppins(
            fontSize: screenHeigth * 0.020,
            color: titleTextColor
          )),
    )
    );
  }
}